extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$World/Player.connect("dialog",$TextBox,"add_texts")
	$TextBox.connect("text_display_started",self,"_text_start")
	$TextBox.connect("text_display_finished",self,"_text_end")
	pass # Replace with function body.

func _text_start(textbox):
	BranchPause.pause_scene($World, true)
	pass

func _text_end(textbox):
	BranchPause.pause_scene($World, false)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
