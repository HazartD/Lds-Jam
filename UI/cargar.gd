extends Button

func _on_button_down():
	Save.NombrePartida="user://HazartD/7DNA/"+self.text
	Save.load_g()
	print(Save.NombrePartida)
