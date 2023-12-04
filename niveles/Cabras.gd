extends escenario
var num:int=0
enum hechos{test,prosti}


func _ready():
	set_play()
	$before.finished.connect(func():$before.play())
	$Label.text=str(num)
	if Progresos.progresion["inven"].has(Progresos.Objetos.TRAUMA) or Progresos.progresion["inven"].has(Progresos.Objetos.HEART):
		$ent/Entidad/CollisionShape2D.queue_free()
		$ent/Entidad/Placeholder.queue_free()
	print("cabra reydeado")
func _on_tree_entered():
	print("cabra en el arbol")
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
			await D.metertexto(["","d1","d2","d3"],"he")
			
			await D.metertexto(["i1","i2","i3"],"she")
			
			D.opcion({"op1"=op1,"op2"=op2,"op3"=op3},"ask1")
		elif Progresos.hecho["cabra"].has(hechos.prosti):
			pass
		else:
			if Progresos.progresion["inven"].has(Progresos.Objetos.PITO):
				await D.metertexto(["","r1"])
				
				play.update_bar()
			if Progresos.progresion["inven"].has(Progresos.Objetos.PELOTA):
				await D.metertexto(["","i8"],"she")
				
			if Progresos.progresion["inven"].has(Progresos.Objetos.TRAUMA):
				await D.metertexto(["","d2","d3"],"he")
				
				await D.metertexto(["...","no","me"])
			
	
	else:
		if !Progresos.hecho["cabra"].has(hechos.test):
			Progresos.hecho["cabra"].append(hechos.test)
			await D.metertexto(["","d3"],"he")
			
			D.opcion({"aop1"=op2,"op3"=op3},"ask1")
		else:
			if Progresos.progresion["inven"].has(Progresos.Objetos.HEART):
				await D.metertexto(["","i4"],"she")
			if Progresos.hecho["cabra"].has(hechos.prosti):
				await D.metertexto(["","d3"],"he")
				
				D.opcion({"aop1"=op2,"op3"=op3},"ask1")
		
func op1():
	Progresos.progresion["inven"].append(Progresos.Objetos.PITO)
	Progresos.progresion["neurosis"]+=1
	print_data()
	await D.metertexto(["d4","d5"],"he")
	
	play.update_bar()
func op2():
	print_data()
	$ent/Entidad/CollisionShape2D.queue_free()
	$ent/Entidad/Placeholder.queue_free()
	if Progresos.mode==0:
		Progresos.progresion["inven"].append(Progresos.Objetos.PELOTA)
		await D.metertexto(["i4","i5"],"she")
	else:
		Progresos.progresion["inven"].append(Progresos.Objetos.HEART)
		await D.metertexto(["ai4","i7"],"she")
		Progresos.progresion["violence"]+=1
	
func op3():
	if Progresos.mode==0:
		Progresos.progresion["voluntad"]-=1
		Progresos.progresion["inven"].append(Progresos.Objetos.TRAUMA)
		print_data()
		await D.metertexto(["i6","i7"],"she")
		
		await D.metertexto(["d6","d7"],"he")
		play.update_bar()
		
		await D.metertexto(["fuck"])
	else:
		Progresos.hecho["cabra"].append(hechos.prosti)
		await D.metertexto(["r2"])
	

func _on_elemento_interaccion():
	if Progresos.mode==0:
		await D.metertexto(["","menos"])
		play.update_bar()
	else:
		await D.metertexto(["","amenos"])
		
		Seales.dia_in()



func _on_tree_exited():
	print("cabasr fuera del arbol")
