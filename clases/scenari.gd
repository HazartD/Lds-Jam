class_name escenario extends Node2D
@onready var play:Player=$"../player"
@export var puertas:Dictionary
#la primera es la de estar adentro y la segunda es la de salir
var techos:Array[Sprite2D]
#se setea en el ready
func _init():
	Seales.change.connect(after)
	Seales.ESCENA_CAMBIO.connect(cambi)
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

func puertar(inde:int,saliendo:bool):
	var t=get_tree().create_tween()
	t.tween_property(techos[inde],"modulate:a",float(saliendo),1)
	if saliendo:t.tween_property(play,"position",puertas[inde][0],0.5)
	else:t.tween_property(play,"position",puertas[inde][1],0.5)
	match play.Est_Act:
		0:play.set_down()
		2:play.set_up()
		3:play.set_right()
		4:play.set_left()
	
	
