extends Area2D

signal next_world


func _on_Portal_body_entered(body:PhysicsBody2D):
	if body.is_in_group("Player"):
		emit_signal("next_world")
