extends Player
#func change():
func _input(event):
	if event.is_action("ui_cancel"): print("si")
