extends Position2D

export(Vector2) var grid_size:= OS.get_real_window_size()
var grid_position:= Vector2()

onready var parent = get_parent()

func _ready():
	update_grid_position()
	set_as_toplevel(true)
	
	
func _physics_process(delta):
	update_grid_position()

func update_grid_position():
	var x = round(parent.position.x / grid_size.x)
	var y = round(parent.position.y / grid_size.y)
	var new_grid_position = Vector2(x, y)
	if grid_position == new_grid_position:
		return
	grid_position = new_grid_position
	position = grid_position * grid_size