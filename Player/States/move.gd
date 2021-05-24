extends "res://Util/state.gd"

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input_direction

func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.look_direction = direction
	if not direction.x in [-1, 1]:
		return
	owner.get_node("BodyPivot").set_scale(Vector2(direction.x, 1))

func update(delta):
	var p = owner as Player
	p.velocity.y += p.gravity*delta
	p.move_and_slide(p.velocity*delta, Vector2.UP)
	if p.is_on_floor():
		p.velocity.y = 0
