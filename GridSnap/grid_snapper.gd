tool
extends Position2D

export(Vector2) var grid_size := Vector2() setget _set_grid_size

var grid_position:= Vector2()
var editor_position:= Vector2()

onready var parent = get_parent()

func _ready():
	set_as_toplevel(true)
	if grid_size == Vector2():
		grid_size = get_viewport_rect().size
	
	
	if not Engine.editor_hint:
		update_grid_position(parent.position)
	
func _physics_process(delta):
	if not Engine.editor_hint:
		update_grid_position(parent.position)
	if Engine.editor_hint:
		update_editor_grid_position(get_local_mouse_position())

func _process(delta):
	pass

func update_grid_position(_position):
	var new_grid_position = calc_grid_position(_position-position)
	if grid_position == new_grid_position:
		return
	grid_position = new_grid_position
	$Camera2D.position = grid_position * grid_size

func update_editor_grid_position(_position):
	editor_position = calc_grid_position(_position) * grid_size
	update()

func calc_grid_position(_position):
	var x = round(_position.x / grid_size.x)
	var y = round(_position.y / grid_size.y)
	return  Vector2(x, y)



func _draw():
	if Engine.editor_hint:
		draw_rect(Rect2(editor_position-grid_size/2,grid_size), Color.red, false, 1, false)
	
func _set_grid_size(gridsize):
	grid_size = gridsize
	update()
