extends CanvasLayer


export(PackedScene) var first_scene

func _ready():
	if OS.has_feature("pc"):
		OS.window_fullscreen = true
	
	SignalSingleton.emit_signal("goto_world",first_scene)
