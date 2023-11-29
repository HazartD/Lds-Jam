class_name escenario extends Node2D
func _init():
	Seales.ESCENA_CAMBIO.connect(escam)
	Seales.change.connect(after)
	Seales.DIA_CAMBIO.connect(diacam)
func set_play():
	$"../player".position = $palplayer.position
	
func after():
	pass

func escam():
	var li=Seales.liminal.instantiate()
	add_sibling(li)
	queue_free()

func diacam():
	queue_free()

func print_data():
	print("progre:  "+str(Progresos.progresion))
