extends Node
enum Escenarios{GOAT}
enum DIA{CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,REQUESON}
enum cambio_mode{BEFORE,AFTER}
enum Objetos {PITO,TRAUMA,PELOTA,NOTA_CABRA,HEART}
var mode:cambio_mode=cambio_mode.BEFORE
var escenario:Escenarios=Escenarios.GOAT
var dia_es:DIA=DIA.CERO
var progresion:Dictionary={"InteraTotal":0,"Nlife":0,"cordura":10,"neurosis":0,"sumicion":0,"violence":0,"inven":[Objetos.NOTA_CABRA]}
var hecho:Dictionary={"cabra":[],"templo":[]}

func save()->Dictionary:
	var saver ={"p":null,"progresion":progresion,"dia_es":dia_es,"escenario":escenario,"mode":mode,"hecho":hecho}
	return saver
