extends Area2D


var player: Player = null
var triggered: bool = false

func _physics_process(delta):
	if player and !triggered:
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
	triggered = true
	Global.deaths += 1
	BranchPause.pause_scene(player, true)
	$sound.play()
	yield(get_tree().create_timer(1),"timeout")
	MusicPlayer.play("sad")
	yield(get_tree().create_timer(3),"timeout")
	$Credits.show()
	yield(get_tree().create_timer(3),"timeout")
	SignalSingleton.emit_signal("push_scene",ScenesSingleton.retry)
