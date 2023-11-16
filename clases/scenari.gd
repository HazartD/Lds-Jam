class_name escenario extends Node2D
func _init():
	Seales.ESCENA_CAMBIO.connect(cam)
	Seales.change.connect(after)
	Seales.DIA_CAMBIO.connect(func():get_tree().change_scene_to_file("res://UI/interdias.tscn"))
func _ready():
	if Progresos.mode==Progresos.cambio_mode.AFTER: after()
func cam():
	pass

func after():
	pass

func print_data():
	print("inentari:  "+str(Progresos.inven))
	print("progre:  "+str(Progresos.progresion))
