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


var delay = 0.1
var power = 1.25
var time = 0
var aiming_at = Vector2.RIGHT


func enter():
	owner.get_node("AnimationPlayer").play("jump")
	time = 0

func end():
	var dir

	var p = owner as Player
	if -aiming_at.y < abs(aiming_at.x)/2:
		aiming_at.y = -abs(aiming_at.x)/2
	
	var jump_dir = aiming_at.normalized()
	
	p.velocity += p.jump_speed * power * jump_dir
	
	emit_signal("finished", "idle", null)

func handle_input(event:InputEvent):
	var p = owner as Player
	if event.is_action_released("jump"):
		aiming_at = (event.position - (p.get_global_transform_with_canvas().origin))
		
		
func update(delta):
	.update(delta)
	var p = owner as Player
	time += delta
	if !Input.is_action_pressed("jump"):
		for setting in settings:
			if time < setting.delay:
				break
			power = setting.power
			
		end()
	elif !p.is_on_floor():
		emit_signal("finished", "air", null)
	else:
		p.velocity.x = approach(p.velocity.x, 0, 25000*delta)
