extends escenario
var num:int=0
enum hechos{test,prosti}


func _ready():
#	set_play()
	$before.finished.connect(func():$before.play())
	$Label.text=str(num)
	if Progresos.progresion["inven"].has(Progresos.Objetos.TRAUMA) or Progresos.progresion["inven"].has(Progresos.Objetos.HEART):
		$ent/Entidad/CollisionShape2D.queue_free()
		$ent/Entidad/Placeholder.queue_free()

func _process(_delta):
	num+=1
	$Label.text=str(num)
	#if num>=700:get_tree().change_scene_to_file("res://niveles/Templo.tscn")

func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path(),"num":num}
	return saver

func _on_entidad_interaccion():
	if Progresos.mode==0:
		if !Progresos.hecho["cabra"].has(hechos.test):
			Progresos.hecho["cabra"].append(hechos.test)
			Progresos.progresion["InteraTotal"]+=1
			D.metertexto(["","d1","d2","d3"],"he")
			await D.FIN
			D.metertexto(["i1","i2","i3"],"she")
			await D.FIN
			D.opcion({"op1"=op1,"op2"=op2,"op3"=op3},"ask1")
		elif Progresos.hecho["cabra"].has(hechos.prosti):
			pass
		else:
			if Progresos.progresion["inven"].has(Progresos.Objetos.PITO):
				D.metertexto(["","r1"])
				await D.FIN
				$"../player".update_bar()
			if Progresos.progresion["inven"].has(Progresos.Objetos.PELOTA):
				D.metertexto(["","i8"],"she")
				await D.FIN
			if Progresos.progresion["inven"].has(Progresos.Objetos.TRAUMA):
				D.metertexto(["","d2","d3"],"he")
				await D.FIN
				D.metertexto(["...","no","me"])
			await D.FIN
	
	else:
		if !Progresos.hecho["cabra"].has(hechos.test):
			Progresos.hecho["cabra"].append(hechos.test)
			D.metertexto(["","d3"],"he")
			await D.FIN
			D.opcion({"aop1"=op2,"op3"=op3},"ask1")
		else:
			if Progresos.progresion["inven"].has(Progresos.Objetos.HEART):
				D.metertexto(["","i4"],"she")
			if Progresos.hecho["cabra"].has(hechos.prosti):
				D.metertexto(["","d3"],"he")
				await D.FIN
				D.opcion({"aop1"=op2,"op3"=op3},"ask1")
		await D.FIN
func op1():
	Progresos.progresion["inven"].append(Progresos.Objetos.PITO)
	Progresos.progresion["neurosis"]+=1
	print_data()
	D.metertexto(["d4","d5"],"he")
	await D.FIN
	$"../player".update_bar()
func op2():
	print_data()
	$ent/Entidad/CollisionShape2D.queue_free()
	$ent/Entidad/Placeholder.queue_free()
	if Progresos.mode==0:
		Progresos.progresion["inven"].append(Progresos.Objetos.PELOTA)
		D.metertexto(["i4","i5"],"she")
	else:
		Progresos.progresion["inven"].append(Progresos.Objetos.HEART)
		D.metertexto(["ai4","i7"],"she")
		Progresos.progresion["violence"]+=1
	await D.FIN
func op3():
	if Progresos.mode==0:
		Progresos.progresion["voluntad"]-=1
		Progresos.progresion["inven"].append(Progresos.Objetos.TRAUMA)
		print_data()
		D.metertexto(["i6","i7"],"she")
		await D.FIN
		D.metertexto(["d6","d7"],"he")
		$"../player".update_bar()
		await D.FIN
		D.metertexto(["fuck"])
	else:
		Progresos.hecho["cabra"].append(hechos.prosti)
		D.metertexto(["r2"])
	await D.FIN

func _on_elemento_interaccion():
	if Progresos.mode==0:
		D.metertexto(["","menos"])
		$"../player".update_bar()
	else:
		D.metertexto(["","amenos"])
		await D.FIN
		Seales.dia_in()

