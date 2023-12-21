extends CanvasLayer
var siguientesena:int
func _init():
	Seales.ESCENA_CAMBIO.connect(continu)
	siguientesena=randi_range(1,3)#para no poner a cada rato el randirange se setea aqui

func day_0():
	await D.metertexto(["0d1","0d2"])
	Seales.esencam_in(0)
func day_1():
	await D.metertexto(["1d1","1d2"])
	var play=load("res://entidades/player.tscn")
	var pli=play.instantiate()
	add_sibling(pli)
	Seales.esencam_in(siguientesena)
func day_2():
	pass
func day_3():
	pass
func day_4():
	pass
func day_5():
	pass
func day_6():
	pass
func day_requeson():
	pass

func _ready():
	print("interdias reydeado")
	match Progresos.dia_es:
		0:day_0()
		1:day_1()
		2:day_2()
		3:day_3()
		4:day_4()
		5:day_5()
		6:day_6()
		7:day_requeson()

func continu():
	queue_free()
func _on_button_button_down():
	get_tree().quit()


func _on_tree_entered():
	print("interdias en arbol")


func _on_tree_exited():
	print("interdias fuera del arbol")
