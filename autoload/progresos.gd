extends Node
enum Escenarios{INTRO,GOAT,TEMPLE,MISSING_COCK}
enum DIA{CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,REQUESON}
enum Objetos {PITO,TRAUMA,PELOTA,NOTA_CABRA,HEART}
var mode_after:bool=false
var dia_es:DIA=DIA.CERO
var progresion:Dictionary={"InteraTotal":0,"cordura":10,"neurosis":0,"voluntad":0,"violence":0,"inven":[Objetos.NOTA_CABRA]}
var hecho:Dictionary={"Escenarios":[],"cabra":[],"templo":[],"cock":[]}

func save()->Dictionary:
	var saver ={"p":null,"progresion":progresion,"dia_es":dia_es,"escenario":escenario,"mode_after":mode_after,"hecho":hecho}
	return saver
