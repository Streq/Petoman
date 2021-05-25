extends "air.gd"

func enter():
	owner.get_node("AnimationPlayer").play("bonk")

func update(delta):
	.update(delta)

func _on_animation_finished(anim_name):
	emit_signal("finished", "air")
