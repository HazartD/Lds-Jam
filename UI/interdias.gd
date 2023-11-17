extends Control

func _ready():
	$Button.grab_focus()


func _on_button_button_down():
	get_tree().quit()
