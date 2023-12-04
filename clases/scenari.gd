class_name escenario extends Node2D
@onready var play:Player=$"../player"
func _init():
	Seales.ESCENA_CAMBIO.connect(cambi)
	Seales.change.connect(after)
	Seales.DIA_CAMBIO.connect(cambi)
func set_play():
	play.position = $palplayer.position

func after():
	pass

func cambi():
	queue_free()

func print_data():
	print("progre:  "+str(Progresos.progresion))
	print("hechos:  "+str(Progresos.hecho))
	
