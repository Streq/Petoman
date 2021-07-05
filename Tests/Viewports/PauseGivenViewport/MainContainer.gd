extends CenterContainer

export (Vector2) var size


func _ready():
	get_tree().connect("screen_resized", self, "_screen_resized")
	_screen_resized()

func _screen_resized():
	var window_size = OS.get_window_size()

	# see how big the window is compared to the viewport size
	# floor it so we only get round numbers (0, 1, 2, 3 ...)
	var scale_x = floor(window_size.x / (size.x))
	var scale_y = floor(window_size.y / (size.y))

	# use the smaller scale with 1x minimum scale
	var scale = max(1, min(scale_x, scale_y))

	self.rect_scale = Vector2(1,1)*scale
