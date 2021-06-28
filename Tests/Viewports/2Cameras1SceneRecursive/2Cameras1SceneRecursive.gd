extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$ViewportContainer2/Viewport.world_2d = $ViewportContainer/Viewport.world_2d
	pass # Replace with function body.
