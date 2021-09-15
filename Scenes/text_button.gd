extends Node

export (String) var display_text

signal change_text(text)


func clicked():
	emit_signal("change_text", display_text)
