extends Node

var index := 0

export (NodePath) var buttons_path
onready var buttons_container := get_node(buttons_path)
onready var buttons := buttons_container.get_children()
onready var length := buttons.size()


func _input(event):
	var update = false
	if event.is_action_pressed("ui_up"):
		index = (index+length-1)%length
		_update_index()
	if event.is_action_pressed("ui_down"):
		index = (index+1)%length
		_update_index()
	if event.is_action_pressed("A"):
		enter()

func _update_index():
	pass

func enter():
	buttons[index].clicked()

