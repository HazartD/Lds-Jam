extends Node

func _input(event):
	if event.is_action("ui_accept"):$celect.play()
	if event.is_action("ui_cancel"):$cancel.play()
