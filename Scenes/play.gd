extends Label

export (PackedScene) var scene

func clicked():
	SignalSingleton.emit_signal("goto_world", scene)
