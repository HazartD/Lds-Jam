class_name escenario extends Node2D
func _init():
	Seales.ESCENA_CAMBIO.connect(cam)
	Seales.change.connect(after)
	Seales.DIA_CAMBIO.connect(diacam)
func set_play():
	$"../player".position = $palplayer.position
	
func after():
	pass

func cam():
	var li=Seales.liminal.instantiate()
	add_sibling(li)
	queue_free()

func diacam():
	var nex= load("res://clases/interdias.tscn")
	var next=nex.instantiate()
	add_sibling(next)
	get_node("/root/main/player").queue_free()
	queue_free()

func print_data():
	print("progre:  "+str(Progresos.progresion))
