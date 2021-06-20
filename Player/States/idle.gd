extends "move.gd"


func enter():
	owner.get_node("AnimationPlayer").play("idle")

func update(delta):
	.update(delta)
	
	var input_direction = get_input_direction()
	
	var p = owner as Player

	p.velocity.x = approach(p.velocity.x, 0, 100000*delta)
	if p.is_on_floor():
		
		if p.jump:
			emit_signal("finished", "jump", input_direction.y)
		elif input_direction.x:
			emit_signal("finished", "run", null)
		elif abs(p.velocity.x) > 10000:
			emit_signal("finished", "stop", null)
	else:
		emit_signal("finished", "air", null)
	
	p.jump = false

