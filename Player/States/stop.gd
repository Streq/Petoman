extends "move.gd"

var jump := false

func enter():
	owner.get_node("AnimationPlayer").play("stop")


func update(delta):
	.update(delta)
	
	var input_direction = get_input_direction()
	
	var p = owner as Player

	if p.is_on_floor():
#		p.velocity.x = lerp(p.velocity.x, 0, 0.1)
		p.velocity.x = approach(p.velocity.x, 0, 25000*delta)
		
		if jump:
			p.velocity.y -= p.jump_speed
		if input_direction.x == p.look_direction.x:
			emit_signal("finished", "run")
		elif abs(p.velocity.x) < 2000:
			p.velocity.x = 0
			emit_signal("finished", "idle")
	else:
		emit_signal("finished", "air")
		
	jump = false
	

func handle_input(event):
	if(event.is_action_pressed("jump")):
		jump = true
