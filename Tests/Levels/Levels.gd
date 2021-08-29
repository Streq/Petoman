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
	SignalSingleton.connect("goto_world", self, "_goto_world")
	
	

func _goto_world(world):
	$GUIRoot.set_world(world.instance())
