extends CanvasLayer

"""
TextBox HUD, works perfectly for chaining short messages.
Can't handle long messages given it lacks context regarding length of visible
characters
"""

const CHAR_READ_RATE = 0.01
enum State {
	READY,
	READING,
	FINISHED
}


export (int) var max_lines
onready var textbox_container = $TextboxContainer
onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
onready var panel_length = label.text.length()


var current_state = State.READY
var text_queue = []

func _ready():
	print("Start State.READY")
	label.max_lines_visible = max_lines
	hide_textbox()
	return


func _process(delta):
	match current_state:
		State.READY:
			if label.get_line_count() - label.lines_skipped > max_lines:
				start_symbol.text = ""
				label.lines_skipped += max_lines
				change_state(State.READING)
				tween_text()
			elif !text_queue.empty():
				display_text()
			else:
				hide_textbox()
		State.READING:
			print(label.percent_visible)
			if Input.is_action_just_pressed("ui_accept"):
				end_tween_early()
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
		
"""
add some text of arbitrary length.
if the text is several panels long we want to separate it into smaller texts 
that fit into the panel and queue those.
the thing is that wordwrap doesn't give us a consistent length, different
texts with the same character length can take up a different amount of lines
"""
func add_text(text: String):
	print("adding: "+text)
	text_queue.push_back(text)

func queue_text(next_text):
	text_queue.push_back(next_text)


func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.lines_skipped = 0
	change_state(State.READING)
	show_textbox()
	tween_text()



func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
			pass
		State.READING:
			print("Changing state to: State.READING")
			pass
		State.FINISHED:
			print("Changing state to: State.FINISHED")
			pass

func tween_text():
	label.percent_visible = 0
	end_symbol.text = ""
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, CHAR_READ_RATE * label.text.length(), Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
#	end_tween_early()

func end_tween_early():
	label.percent_visible = 1.0
	$Tween.stop_all()
	finished_reading()

func _on_Tween_tween_completed(object, key):
	finished_reading()

func finished_reading():
	end_symbol.text = "v" if !text_queue.empty() or (label.get_line_count() - label.lines_skipped > max_lines) else ""
	change_state(State.FINISHED)
