extends "move.gd"

var jump := false

var finished := false

func enter():
	owner.get_node("AnimationPlayer").play("land")


func update(delta):
	.update(delta)
	
	var p = owner as Player
	
	if p.is_on_floor():
		p.velocity.x = approach(p.velocity.x, 0, 30000*delta)
		
	

func handle_input(event):
	if(event.is_action_pressed("jump")):
		jump = true

func _on_animation_finished(name):
	emit_signal("finished","idle")
