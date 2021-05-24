extends "move.gd"

var jump := false

func enter():
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	owner.get_node("AnimationPlayer").play("run")

func update(delta):
	.update(delta)
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	var p = owner as Player
	
	p.velocity.x = p.run_max_speed*input_direction.x
	
	if p.is_on_floor():
		if jump:
			p.velocity.y -= p.jump_speed
		if not input_direction.x:
			emit_signal("finished", "idle")
	else:
		emit_signal("finished", "air")
	
	jump = false

func handle_input(event):
	if(event.is_action_pressed("jump")):
		jump = true
