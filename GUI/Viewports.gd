extends Node2D
signal set_world(world)


func _set_world(world):
	emit_signal("set_world",world)
