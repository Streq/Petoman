class_name Player
extends KinematicBody2D

signal dialog(dialogs)


var look_direction := Vector2.RIGHT
var velocity := Vector2.ZERO

var gravity := 20000
var run_max_speed := 10000
var jump_speed := 11000

onready var state_machine = $StateMachine
onready var animation_player = $AnimationPlayer

var jump := false

var actionables := []

func _ready():
	pass

func subscribe_actionable(actionable):
	actionables.push_back(actionable)
	print(actionables)

func unsubscribe_actionable(actionable):
	actionables.erase(actionable)
	print(actionables)

func trigger_actionable(actionable):
	actionable.trigger(self)


func _physics_process(delta):
	pass

func _input(event):
	if event.is_action_pressed("A"):
		if !actionables.empty():
			trigger_actionable(actionables[0])
		else:
			jump = true
	if event.is_action_released("A"):
		jump = false
