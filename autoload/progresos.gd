extends Node
enum Escenarios{GOAT}
enum DIA{CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,REQUESON}
enum cambio_mode{BEFORE,AFTER}
var mode:cambio_mode=cambio_mode.BEFORE
var escenario:Escenarios=Escenarios.GOAT
var dia_es:DIA
var progresion={"ww":1}

func save()->Dictionary:
	var saver ={"p":null,"progresion":progresion,"dia_es":dia_es,"escenario":escenario,"mode":mode}
	return saver
