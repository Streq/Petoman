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
		"lean": $lean,
		"lean_jump": $lean_jump,
	}

func _change_state(state_name, param):
	if not _active:
		return
	if state_name in ["jump","lean_jump"]:
		states_map[state_name].initialize(param)
	._change_state(state_name, param)
