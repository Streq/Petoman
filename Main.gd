extends CanvasLayer


export(PackedScene) var first_scene

func _ready():
	SignalSingleton.emit_signal("goto_world",first_scene)
