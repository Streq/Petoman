class_name Player
extends KinematicBody2D




var look_direction := Vector2.RIGHT
var velocity := Vector2.ZERO

var gravity := 20000
var run_max_speed := 10000
var jump_speed := 11000

var jump := false


func _ready():
	pass




func _input(event):
	if(event.is_action_pressed("jump")):
		jump = true
