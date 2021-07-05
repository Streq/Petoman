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
	}
]


var delay = 0.1
var power = 1.25
var time = 0


func enter():
	owner.get_node("AnimationPlayer").play("jump")
	time = 0

func end():
	var p = owner as Player	
	p.velocity.y -= p.jump_speed * power
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


