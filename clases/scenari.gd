class_name escenario extends Node2D
@onready var play:Player=$"../player"
@export var puertas:Dictionary
@export var posisionesdelosquesemueen:Array[Vector2]
#la primera es la de estar afuera y la segunda es la de entrar
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

func puertar(inde:int,saliendo:int):
	var t=get_tree().create_tween()
	t.tween_property(techos[inde],"modulate:a",saliendo,1)
	t.tween_property(play,"position",puertas[inde][saliendo],0.5)#no lo he comprobado pero quiero que sea asi 0 y 1 para agarrar las 2
#	else:t.tween_property(play,"position",puertas[inde][1],0.5)
	match play.Est_Act:
		0:play.set_down()
		2:play.set_up()
		3:play.set_right()
		4:play.set_left()
	
	
