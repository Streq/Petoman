extends Area2D


func _body_entered(body):
	if body.is_in_group("Player"):
		body.emit_signal("dialog", ["le voy a llevar galletitas de agua a la abuela"])
		queue_free()
