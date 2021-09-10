extends Area2D


var player:Player = null

func _physics_process(delta):
	if player:
		var state_machine:StateMachine = player.state_machine
		if state_machine.current_state.name == "fell":
			yield(get_tree().create_timer(0.01), "timeout")
			trigger_cutscene()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_body_exited(body):
	if body == player:
		player = null


func trigger_cutscene():
# Doesn't work because children will still update
#	player.set_physics_process(false)
	BranchPause.pause_scene(player, true)
