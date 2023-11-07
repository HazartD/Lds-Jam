extends Node
enum Objetos {PITO,TRAUMA,PELOTA,NOTA_CABRA}
var inven:Array[Objetos]=[Objetos.PITO,Objetos.TRAUMA,Objetos.NOTA_CABRA,Objetos.PELOTA]

func save()->Dictionary:
	var saver ={"i":null,"inven":inven}
	return saver
