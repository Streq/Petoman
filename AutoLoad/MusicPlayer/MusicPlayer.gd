extends Node

var current:AudioStreamPlayer = null

func play(song):
	stop()
	current = self.get_node(song)
	current.play()

func stop():
	if current:
		current.stop()
