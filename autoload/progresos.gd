extends Node
enum Escenarios{GOAT}
enum DIA{CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,REQUESON}
enum cambio_mode{BEFORE,AFTER}
enum Objetos {PITO,TRAUMA,PELOTA,NOTA_CABRA}
var inven:Array[Objetos]=[Objetos.NOTA_CABRA]
var mode:cambio_mode=cambio_mode.BEFORE
var escenario:Escenarios=Escenarios.GOAT
var dia_es:DIA=DIA.CERO
var progresion:Dictionary={"InteraTotal":0,"Nlife":0,"cordura":10,"neurosis":0,"sumicio":0,"violence":0}
var hecho:Dictionary={"cabra":[],"templo":[]}

func save()->Dictionary:
	var saver ={"p":null,"progresion":progresion,"dia_es":dia_es,"escenario":escenario,"mode":mode,"inven":inven,"hecho":hecho}
	return saver
