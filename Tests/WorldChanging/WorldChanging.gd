extends Node

func _ready():
	var world = $World
	remove_child(world)
	SignalSingleton.emit_signal("goto_world", world)
