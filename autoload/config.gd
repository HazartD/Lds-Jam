extends Node
var dirc
func _init():
	dirc=DirAccess.open("user://HazartD/7DNA")
	if FileAccess.file_exists("user://HazartD/7DNA/Config_and_data.ini"):carg()
func guar():
	var con= ConfigFile.new()
	con.set_value("general","languaje",TranslationServer.get_locale())
	con.set_value("general","windowmode",DisplayServer.window_get_mode())
	con.set_value("auidio","bgm",AudioServer.get_bus_volume_db(1))
	con.set_value("auidio","sfx",AudioServer.get_bus_volume_db(2))
	con.set_value("auidio","ui",AudioServer.get_bus_volume_db(3))
	con.save("user://HazartD/7DNA/Config_and_data.ini")

func carg():
	var con=ConfigFile.new()
	var err=con.load("user://HazartD/7DNA/Config_and_data.ini")
	if err != OK: return
	print("config load error: "+str(err))
	TranslationServer.set_locale(con.get_value("general","languaje"))
	DisplayServer.window_set_mode(con.get_value("general","windowmode"))
	AudioServer.set_bus_volume_db(1,con.get_value("auidio","bgm"))
	AudioServer.set_bus_volume_db(2,con.get_value("auidio","sfx"))
	AudioServer.set_bus_volume_db(3,con.get_value("auidio","ui"))
	
