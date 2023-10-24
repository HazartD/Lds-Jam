extends Node

var locali:String=OS.get_locale_language()
var parti:int=0
func _init():
	
	if locali !="es": locali="en"
func guar():
	var con= ConfigFile.new()
	con.set_value("general","languaje",locali)
	con.set_value("partidas","numero",parti)
	con.save("user://7DNA.ini")

func carg():
	var con=ConfigFile.new()
	var err=con.load("user://7DNA.ini")
	if err != OK: return
	for dato in con.get_sections():
		locali=con.get_value("general","languaje")
		parti= con.get_value("partidas","numero")
