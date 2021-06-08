extends "res://Util/state_machine.gd"

func _ready():
	states_map = {
		"idle": $idle,
		"run": $run,
		"air": $air,
		"stop": $stop,
		"bonk": $bonk,
		"land": $land,
		"jump": $jump,
	}

func _change_state(state_name, param):
	if not _active:
		return
	if state_name == "jump":
		states_map.jump.initialize(param)
	._change_state(state_name, param)
