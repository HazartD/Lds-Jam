extends Button

func _on_button_down():
	Save.NombrePartida=self.text
	Save.load_g()
	print(Save.NombrePartida)
