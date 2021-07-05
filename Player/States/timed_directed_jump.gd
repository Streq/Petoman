extends "move.gd"

const settings = [
	{
		delay = 0,
		power = 0.75
	},
	{
		delay = 0.05,
		power = 1.0
	},
	{
		delay = 0.2,
		power = 1.25
	},
#	{
#		delay = 0.5,
#		power = 2.0
#	},
#
#	{
#		delay = 0.75,
#		power = 3.0
#	},
#
#	{
#		delay = 1.0,
#		power = 4.0
#	},
]

const aims = [
	Vector2(cos(deg2rad(90)), sin(deg2rad(90))),
	Vector2(cos(deg2rad(65)), sin(deg2rad(65))),
	Vector2(cos(deg2rad(45)), sin(deg2rad(45))),
	Vector2(cos(deg2rad(30)), sin(deg2rad(30))),
]

var delay = 0.1
var power = 1.25
var time = 0


func enter():
	owner.get_node("AnimationPlayer").play("jump")
	time = 0

func end():
	var dir = get_input_direction()

	var p = owner as Player	
	var jump_dir
	if !dir.x:
		jump_dir = aims[0]
	elif dir.y == -1:
		jump_dir = aims[1]
	elif dir.y == 0:
		jump_dir = aims[2]
	elif dir.y == 1:
		jump_dir = aims[3]
	
	p.velocity += p.jump_speed * power * jump_dir * Vector2(dir.x,-1)
	
	emit_signal("finished", "idle", null)

func update(delta):
	.update(delta)
	var p = owner as Player	
	time += delta
	if !Input.is_action_pressed("A") or time >= 0.2:
		for setting in settings:
			if time < setting.delay:
				break
			power = setting.power
			
		end()
	elif !p.is_on_floor():
		emit_signal("finished", "air", null)
	else:
		p.velocity.x = approach(p.velocity.x, 0, 25000*delta)

