extends Node


export (PoolStringArray) var dialogs

signal triggered_dialog(dialogs)

func execute(actioner:Player):
	actioner.emit_signal("dialog", dialogs)
