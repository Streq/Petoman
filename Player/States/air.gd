extends "move.gd"

var current_fall_speed = 0

func enter():
	setAnim()
	setFeetCollider(false)

func exit():
	setFeetCollider(true)
	
func setAnim():
	owner.get_node("AnimationPlayer").play("air")
	
func update(delta):
	var p = owner as Player
	
	current_fall_speed = p.velocity.y
	.update(delta)
	
	var input_direction = get_input_direction()
	
	p.velocity.x = lerp(p.velocity.x, p.run_max_speed*input_direction.x, 0.001)
	
	if p.is_on_floor():
		if current_fall_speed > 15000:
			emit_signal("finished", "land", null)
		elif abs(p.velocity.x) < 5000:
			emit_signal("finished", "idle", null)
		elif input_direction.x == p.look_direction.x:
			emit_signal("finished", "run", null)
		else:
			emit_signal("finished", "stop", null)
	elif p.is_on_ceiling():
		emit_signal("finished", "bonk", null)

func setFeetCollider(value):
	owner.get_node("collisionShape").disabled = !value
	owner.get_node("collisionShapeNoFeet").disabled = value
	
