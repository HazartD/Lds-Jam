extends PanelContainer

func _ready():
	$MC/HB/accion/full.grab_focus()


func _on_bgm_value_changed(value):
	AudioServer.set_bus_volume_db(1,value)


func _on_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(2,value)


func _on_ui_value_changed(value):
	AudioServer.set_bus_volume_db(3,value)


func _on_full_toggled(to):
	if to:DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
