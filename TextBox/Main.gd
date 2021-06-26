extends Node2D

onready var t = $TextBox


# Called when the node enters the scene tree for the first time.
func _ready():
	t.add_text("Hola! me llamo santi y voy a ser tu profesor pokemon!")
	t.add_text("no es muy común que nos regalen caramelos hermano pero es así")
	t.add_text("qué querés que te diga")
	t.add_text("la vida empieza y sigue. Pero eso no significa que tengas que olvidar todo lo que viviste. O que sentirse culpable siempre está mal.")
	t.add_text("Yo soy de quienes piensan que el mejor jugador de póker es el que no rompe las pelotas.")

	t.add_text(
"""add some text of arbitrary length.
if the text is several panels long we want to separate it into smaller texts 
that fit into the panel and queue those.
the thing is that wordwrap doesn't give us a consistent length, different
texts with the same character length can take up a different amount of lines"""
	)
	t.add_text("n")
	t.add_text("dije \"n\", por si te lo salteaste sin querer")
	t.add_text("no")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
