extends Area2D


var player: Player = null
var triggered: bool = false

func _physics_process(delta):
	if player and !triggered:
		trigger_cutscene()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_body_exited(body):
	if body == player:
		player = null


func trigger_cutscene():
	triggered = true
	$Mariyo.visible = true
	var pj : Player = player
	pj.velocity.x = -50000
