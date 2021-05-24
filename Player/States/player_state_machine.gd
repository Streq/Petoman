extends "res://Util/state_machine.gd"

func _ready():
	states_map = {
		"idle": $idle,
		"run": $run,
		"air": $air,
	}

func _change_state(state_name):
	if not _active:
		return
	._change_state(state_name)
