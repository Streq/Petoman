extends "res://Util/state_machine.gd"

func _ready():
	states_map = {
		"idle": $idle,
		"run": $run,
		"air": $air,
		"stop": $stop,
		"bonk": $bonk,
		"land": $land,
		"fell": $fell,
		"jump": $jump,
	}

func _change_state(state_name, param):
	if not _active:
		return
	._change_state(state_name, param)
