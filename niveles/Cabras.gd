extends escenario
var num:int=0
const player= preload("res://entidad/player.tscn")
const shader=[preload("res://img/Shaders/invert.gdshader"),preload("res://img/Shaders/repit.gdshader")]
enum hechos{test}



func _ready():
	$before.finished.connect(func():$before.play())
	$Label.text=str(num)
	if Progresos.inven.has(Progresos.Objetos.TRAUMA):
		$ent/Entidad/CollisionShape2D.queue_free()
		$ent/Entidad/Placeholder.queue_free()
	
func after():
	$Fondo/CabraTest.material.shader=shader[0]
	$ent/Entidad/Placeholder.material.shader=shader[1]
	$ent/Entidad/Placeholder2.material.shader=shader[1]
	$el/Elemento/Placeholder.material.shader=shader[0]
	$after.play()
	$after.finished.connect(func():$after.play())
	$before.stop()
	$before.finished.disconnect(func():$before.play())
	pass
func _process(_delta):
	num+=1
	$Label.text=str(num)
#	if num>=700:get_tree().change_scene_to_file("res://niveles/Templo.tscn")
	
func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path(),"num":num}
	return saver

func cam():
	var p=player.instantiate()
	add_child(p)
	p.position=$Marker2D.position

func _on_entidad_interaccion():
	if Progresos.mode==0:
		if !Progresos.hecho["cabra"].has(hechos.test):
			Seales.moverte=false
			Progresos.hecho["cabra"].append(hechos.test)
			Progresos.progresion["InteraTotal"]+=1
			D.metertexto(["","d1","d2","d3"],"he")
			await D.FIN
			D.metertexto(["i1","i2","i3"],"she")
			await D.FIN
			D.fadein()
			D.opcion({"op1"=op1,"op2"=op2,"op3"=op3},"ask1")
		else:
			Seales.moverte=false
			if Progresos.inven.has(Progresos.Objetos.PITO):
				D.metertexto(["","r1"])
				Progresos.progresion["Nlife"]+=1
				await D.FIN
				$player.update_bar()
				Seales.moverte=true
	else:
		if !Progresos.hecho["cabra"].has(hechos.test):
			Seales.moverte=false
			D.metertexto(["","ad1"],"he")
			await D.FIN
			D.fadein()
			D.opcion({"aop1"=op2,"op3"=op3},"ask1")
			pass



func op1():
	Progresos.inven.append(Progresos.Objetos.PITO)
	Progresos.progresion["neurosis"]+=1
	Progresos.progresion["Nlife"]+=1
	print_data()
	D.metertexto(["d4","d5"],"he")
	await D.FIN
	Seales.moverte=true
func op2():
	Progresos.inven.append(Progresos.Objetos.PELOTA)
	print_data()
	$ent/Entidad/CollisionShape2D.queue_free()
	$ent/Entidad/Placeholder.queue_free()
	if Progresos.mode==0:
		D.metertexto(["i4","i5"],"she")
	else:
		D.metertexto(["ai4","ai5"],"she")
		Progresos.progresion["violence"]+=1
	await D.FIN
	Seales.moverte=true
func op3():
	if Progresos.mode==0:
		Progresos.progresion["sumicion"]+=1
		Progresos.inven.append(Progresos.Objetos.TRAUMA)
		Progresos.progresion["cordura"]-=1
		print_data()
		D.metertexto(["i6","i7"],"she")
		await D.FIN
		D.metertexto(["d6","d7"],"he")
		$player.update_bar()
		await D.FIN
		D.metertexto(["fuck"])
		await D.FIN
		Seales.moverte=true
	else:
		
		pass




func _on_elemento_interaccion():
	Seales.moverte=false
	if Progresos.mode==0:
		Progresos.progresion["cordura"]-=1
		D.metertexto(["","menos"])
	else:
		Progresos.progresion["Nlife"]+=1
		D.metertexto(["","amenos"])
	$player.update_bar()
	await D.FIN
	Seales.moverte=true
