extends "res://Scenes/menu.gd"


func _ready():
	_update_index()

func _update_index():
	$index.position = buttons[index].rect_global_position+Vector2(-10,6)
