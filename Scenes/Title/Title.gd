extends "res://Scenes/menu.gd"

func _on_change_text(text):
	$texto.text = text

func _update_index():
	$index.position.y = 64+index*16

func _ready():
	MusicPlayer.stop()
