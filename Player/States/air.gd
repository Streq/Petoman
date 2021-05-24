extends "move.gd"

func enter():
	owner.get_node("AnimationPlayer").play("air")

func update(delta):
	.update(delta)
	
	var input_direction = get_input_direction()
	
	var p = owner as Player
	
	if p.is_on_floor():
		if input_direction.x:
			emit_signal("finished", "run")
		else: 
			emit_signal("finished", "idle")
	
