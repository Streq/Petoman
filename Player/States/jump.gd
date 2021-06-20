extends "move.gd"

const settings = {
	-1 : {
		delay = 0.1,
		power = 1.25
	},
	0 : {
		delay = 0.05,
		power = 1.0
	},
	1 : {
		delay = 0,
		power = 0.75
	},
}

var delay
var power
onready var timer: Timer = Timer.new()

func _ready():
	add_child(timer)
	timer.one_shot = true
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS

func initialize(input_y):
	var setting = settings[int(input_y)]
	delay = setting.delay
	power = setting.power

func enter():
	owner.get_node("AnimationPlayer").play("jump")
	if delay:
		timer.stop()
		timer.wait_time = delay
		timer.start()
	else:
		end()

func end():
	var p = owner as Player	
	p.velocity.y -= p.jump_speed * power
	emit_signal("finished", "idle", null)

func update(delta):
	.update(delta)
	var p = owner as Player	
	if timer.time_left <= 0:
		end()
	elif !p.is_on_floor():
		emit_signal("finished", "air", null)
