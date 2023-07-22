extends Node
export var deaths := 0

func _input(event: InputEvent) -> void:
	if OS.has_feature("pc"):
		if event.is_action_pressed("ui_cancel"):
			get_tree().quit()
