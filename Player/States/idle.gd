extends "move.gd"

var jump := false

func enter():
	owner.get_node("AnimationPlayer").play("idle")

func update(delta):
	.update(delta)
	
	var input_direction = get_input_direction()
	
	var p = owner as Player

	p.velocity.x = approach(p.velocity.x, 0, 100000*delta)
	if p.is_on_floor():
		
		if jump:
			emit_signal("finished", "jump", input_direction.y)
		if input_direction.x:
			emit_signal("finished", "run", null)
		elif abs(p.velocity.x) > 10000:
			emit_signal("finished", "stop", null)
	else:
		emit_signal("finished", "air", null)
	
	jump = false
	

func handle_input(event):
	if(event.is_action_pressed("jump")):
		jump = true
