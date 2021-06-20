extends "jump.gd"

const inv_sqrt_2 = 1/sqrt(2)
const sin_60 = sin(deg2rad(60))
const cos_60 = cos(deg2rad(60))


func end():
	var p = owner as Player	
	p.velocity.y -= p.jump_speed * power * sin_60
	p.velocity.x += p.jump_speed * power * cos_60 * p.look_direction.x
	
	emit_signal("finished", "idle", null)
