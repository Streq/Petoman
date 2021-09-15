extends Control

var index := 0

onready var buttons := $VBoxContainer.get_children()
onready var length := buttons.size()
onready var index_sprite = $index

func _input(event):
	var update = false
	if event.is_action_pressed("ui_up"):
		index = (index+length-1)%length
		update_index()
	if event.is_action_pressed("ui_down"):
		index = (index+1)%length
		update_index()
	if event.is_action_pressed("A"):
		enter()

func update_index():
	index_sprite.position.y = 64+16*index

func enter():
	buttons[index].clicked()


func _on_change_text(text):
	$texto.text = text
