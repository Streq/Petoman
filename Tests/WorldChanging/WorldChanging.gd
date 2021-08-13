extends Node

#All this does is test the set_world() method for GUIRoot, 
#so that you can change scenes within the same GUI


# Called when the node enters the scene tree for the first time.
func _ready():
	var world = $World
	remove_child(world)
	$GUIRoot.set_world(world)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
