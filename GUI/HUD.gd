extends Node2D


onready var world = $World

onready var scene_stack = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextBox.connect("text_display_started",self,"_text_start")
	$TextBox.connect("text_display_finished",self,"_text_end")
	SignalSingleton.connect("goto_world",self,"_set_world")
	SignalSingleton.connect("push_scene",self,"_push_scene")
	SignalSingleton.connect("pop_scene",self,"_pop_scene")
	_connect_signals()
	pass # Replace with function body.

func _text_start(textbox):
	BranchPause.pause_scene(world, true)
	pass

func _text_end(textbox):
	BranchPause.pause_scene(world, false)
	pass

func _connect_signals():
	if world:
		var player = world.get_node("Player")
		if player:
			player.connect("dialog",$TextBox,"add_texts")

func _set_world(world):
	remove_child(self.world)
	self.world = world.instance()
	add_child(self.world)
	_connect_signals()
	
func _push_scene(scene):
	var scene_instance = scene.instance()
	scene_stack.push_back(scene_instance)
	add_child(scene_instance)

func _pop_scene():
	var scene = scene_stack.pop_back()
	remove_child(scene)
