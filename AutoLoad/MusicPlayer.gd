extends Node

var current:AudioStreamPlayer = null

func play(song):
	if current:
		current.stop()
	current = self.get_node(song)
	current.play()

func stop():
	current.stop
