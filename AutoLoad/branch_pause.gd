extends Node


func pause_node(node, value):
	node.set_process(!value)
	node.set_physics_process(!value)
	node.set_process_input(!value)
	node.set_process_internal(!value)
	node.set_process_unhandled_input(!value)
	node.set_process_unhandled_key_input(!value)

func pause_scene(node, value):
	pause_node(node, value)
	for c in node.get_children():
		pause_scene(c, value)
