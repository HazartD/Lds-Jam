extends Node
enum escenarios{}
enum dia{UNO,DOS,TRES,CUATRO,CINCO,SEIS,REQUESON}
enum cambio_mode{BEFORE,AFTER}
var dia_es:dia
var progresion={}
func save()->Dictionary:
	var saver ={"parent":get_parent().get_path(),"filename":get_scene_file_path()}
	return saver
