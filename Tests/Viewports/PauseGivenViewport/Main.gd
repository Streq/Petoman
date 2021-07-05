extends Node


onready var world = $VpWorld
onready var gamescene = $VpWorld/World
onready var hud = $VpHUD
onready var player = $VpWorld/World/Player
onready var textbox = $VpHUD/HUD/TextBox
onready var worldTexture = $VpMain/Textures/CenterScreen/TexWorld
onready var texHUD = $VpMain/Textures/CenterScreen/TexHUD
onready var texWorld = $VpMain/Textures/CenterScreen/TexWorld


func _ready():
	player.connect("dialog", textbox, "add_texts")
	textbox.connect("text_display_started", self, "_text_start")
	textbox.connect("text_display_finished", self, "_text_end")
	
	texHUD.texture = hud.get_texture()
	texWorld.texture = world.get_texture()
	
	pass

func _text_start(textbox):
	remove_child(world)
	pass

func _text_end(textbox):
	add_child(world)
	pass

func _input(event):
	hud.input(event)
	world.input(event)
