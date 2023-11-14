extends Node
enum Objetos {PITO,TRAUMA,PELOTA,NOTA_CABRA}
var inven:Array[Objetos]=[Objetos.NOTA_CABRA]

func save()->Dictionary:
	var saver ={"i":null,"inven":inven}
	return saver
