extends Node2D


onready var world = $World

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextBox.connect("text_display_started",self,"_text_start")
	$TextBox.connect("text_display_finished",self,"_text_end")
	_connect_signals()
	pass # Replace with function body.

func _text_start(textbox):
	BranchPause.pause_scene($World, true)
	pass

func _text_end(textbox):
	BranchPause.pause_scene($World, false)
	pass

func _connect_signals():
	if world:
		var player = world.get_node("Player")
		if player:
			player.connect("dialog",$TextBox,"add_texts")

func _set_world(world):
	remove_child(self.world)
	self.world = world
	add_child(world)
	_connect_signals()
