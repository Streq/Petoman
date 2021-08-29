extends Area2D

export (PackedScene) var next_world

func _on_Portal_body_entered(body:PhysicsBody2D):
	if body.is_in_group("Player"):
		SignalSingleton.emit_signal("goto_world", next_world)
