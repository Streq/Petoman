extends Label


func clicked():
	SignalSingleton.emit_signal("pop_scene")
	SignalSingleton.emit_signal("goto_world",ScenesSingleton.menu)
