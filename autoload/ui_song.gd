extends Node

func _input(event):
	if event.is_action_pressed("ui_accept"):$celect.play()
	if event.is_action_pressed("ui_cancel"):$cancel.play()
