extends Node
enum objetos {}
var  inven=["","","",{"a":1,"b":2}]

func save()->Dictionary:
	var saver ={"i":null,"inven":inven}
	return saver
