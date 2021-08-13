extends Node2D

"""
The idea here is to have world changing events ingame, for example
a world has a gate in it, and when the player interacts with it, it
triggers a change of worlds
"""

# We need an export variable for the world 1
# And an export variable for the world 2
export (PackedScene) var World1:PackedScene
export (PackedScene) var World2:PackedScene



# Called when the node enters the scene tree for the first time.
func _ready():
	var world1 = World1.instance()
	$GUIRoot.set_world(world1)
	world1.connect("next_world", self, "_next_world")
	
	pass # Replace with function body.

func _next_world():
	$GUIRoot.set_world(World2.instance())
