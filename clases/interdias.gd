extends CanvasLayer
func _init():
	Seales.ESCENA_CAMBIO.connect(continu)
func _ready():
	match Progresos.dia_es:
		0:day_0()
		1:day_1()
		2:day_2()
		3:day_3()
		4:day_4()
		5:day_5()
		6:day_6()
		7:day_requeson()

func day_0():
	await D.metertexto(["0d1","0d2"])
	Seales.esencam_in(0)
func day_1():
	await D.metertexto(["1d1","1d2"])
	Seales.esencam_in(randi_range(1,2))

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

func continu():
	queue_free()
	var li=Seales.liminal.instantiate()
	add_sibling(li)
func _on_button_button_down():
	get_tree().quit()
