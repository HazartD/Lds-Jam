extends Node

var locali:String=OS.get_locale_language()
func _init():
	
	if locali !="es": locali="en"
func guar():
	var con= ConfigFile.new()
	con.set_value("general","languaje",locali)
	con.save("user://7DNA.ini")

func carg():
	var con=ConfigFile.new()
	var err=con.load("user://7DNA.ini")
	if err != OK: return
	for dato in con.get_sections():
		locali=con.get_value("general","languaje")
		
