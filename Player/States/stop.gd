extends "move.gd"

func enter():
	owner.get_node("AnimationPlayer").play("stop")


func update(delta):
	.update(delta)
	
	var input_direction = get_input_direction()
	
	var p = owner as Player

	if p.is_on_floor():
#		p.velocity.x = lerp(p.velocity.x, 0, 0.1)
		p.velocity.x = approach(p.velocity.x, 0, 25000*delta)
#		p.velocity.x = approach(p.velocity.x, 0, 25000*delta)
		if p.jump:
			emit_signal("finished", "jump", input_direction.y)
			pass
		if input_direction.x == p.look_direction.x:
			emit_signal("finished", "run", null)
		elif abs(p.velocity.x) < 2000:
			p.velocity.x = 0
			emit_signal("finished", "idle", null)
	else:
		emit_signal("finished", "air", null)
		
	p.jump = false

