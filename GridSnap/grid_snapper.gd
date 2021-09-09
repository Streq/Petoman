tool
extends Position2D

export(Vector2) var grid_size := Vector2() setget _set_grid_size
export(int) var editor_grid_border_tiles := 3 setget _set_editor_grid_border_tiles
export(bool) var visible_in_editor := true setget _set_visible_in_editor

var grid_position:= Vector2()
var editor_position:= Vector2()
var editor_grid_position:= Vector2()

onready var parent = get_parent()

func _ready():
	set_as_toplevel(true)
	if not Engine.editor_hint:
		if grid_size == Vector2():
			grid_size = get_viewport_rect().size

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
	var new_grid_position = calc_grid_position(_position-position)
	if editor_grid_position == new_grid_position:
		return
	editor_grid_position = new_grid_position
	editor_position = editor_grid_position * grid_size
	update()

func calc_grid_position(_position):
	var x = round(_position.x / grid_size.x)
	var y = round(_position.y / grid_size.y)
	return  Vector2(x, y)


func _draw():
	if Engine.editor_hint and visible_in_editor:
		var start_grid_position = editor_grid_position - Vector2(1,1)*editor_grid_border_tiles
		for x in range(0, editor_grid_border_tiles*2+1):
			for y in range(0, editor_grid_border_tiles*2+1):
				draw_grid_tile((start_grid_position+Vector2(x, y))*grid_size)
			
			
func draw_grid_tile(_position):
	draw_rect(Rect2(_position-grid_size/2,grid_size), Color.red, false, 1, false)

func _set_grid_size(gridsize):
	grid_size = gridsize
	update()

func _set_editor_grid_border_tiles(size:int):
	editor_grid_border_tiles = size
	update()

func _set_visible_in_editor(_visible:bool):
	visible_in_editor = _visible
	update()
