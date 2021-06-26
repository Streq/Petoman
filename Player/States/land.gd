extends "move.gd"

export (String) var animation

func enter():
	owner.get_node("AnimationPlayer").play(animation)


func update(delta):
	.update(delta)
	
	var p = owner as Player
	
	if p.is_on_floor():
		p.velocity.x = approach(p.velocity.x, 0, 30000*delta)

func _on_animation_finished(name):
	emit_signal("finished","idle", null)
