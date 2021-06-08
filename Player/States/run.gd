extends "move.gd"

var jump := false

func enter():
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	owner.get_node("AnimationPlayer").play("run")

func update(delta):
	.update(delta)
	var input_direction = get_input_direction()
	
	var p = owner as Player
	
	p.velocity.x = lerp(p.velocity.x, p.run_max_speed*input_direction.x, 0.05)
	
	if p.is_on_floor():
		if jump:
			emit_signal("finished", "jump", input_direction.y)
		if not input_direction.x:
			if abs(p.velocity.x) < 5000:
				emit_signal("finished", "idle", null)
			else:
				emit_signal("finished", "stop", null)
		elif p.look_direction.x != input_direction.x:
			emit_signal("finished", "stop", null)
	else:
		emit_signal("finished", "air", null)
	
	jump = false

func handle_input(event):
	if(event.is_action_pressed("jump")):
		jump = true
