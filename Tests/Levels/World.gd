extends Node2D

signal next_world

# Called when the node enters the scene tree for the first time.
func _ready():
	if $Portal:
		$Portal.connect("next_world",self,"_next_world")

func _next_world():
	emit_signal("next_world")
