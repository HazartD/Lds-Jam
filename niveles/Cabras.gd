extends Node2D
var num:int=0
const player= preload("res://entidad/player.tscn")
func _init():
	Seales.ESCENA_CAMBIO.connect(cam)
	
func print_data():
	print("inentari:  "+str(Inentary.inven))
	print("progre:  "+str(Progresos.progresion))
	
func _ready():
	$Label.text=str(num)
	

func _process(_delta):
	num+=1
	$Label.text=str(num)
#	if num>=700:get_tree().change_scene_to_file("res://niveles/Templo.tscn")
	
func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path(),"num":num}
	return saver

func _on_static_body_2d_interaccion():
	print("a")
func cam():
	var p=player.instantiate()
	add_child(p)
	p.position=$Marker2D.position



func _on_entidad_interaccion():
	if !Progresos.progresion.has("test"):
		Seales.moverte=false
		Progresos.progresion["test"]=true
		Progresos.progresion["InteraTotal"]+=1
		D.metertexto(["","d1","d2","d3"],"yo")
		await D.FIN
		print("si")
		D.metertexto(["i1","i2","i3"],"she")
		await D.FIN
		print("segundo")
		D.fadein()
		D.opcion({"thrgefw"=thrgefw,"tgrwfeqd"=tgrwfeqd,"sdfgh"=sdfgh},"esrdtfyguhij")



func thrgefw():
	Inentary.inven.append(Inentary.Objetos.PITO)
	print_data()
	D.metertexto(["¿thrgefw?","d4","d5"],"yo")
	await D.FIN
	Seales.moverte=true
func tgrwfeqd():
	Inentary.inven.append(Inentary.Objetos.PELOTA)
	print_data()
	D.metertexto(["¿tgrwfeqd?","i4","i5"],"she")
	await D.FIN
	Seales.moverte=true
func sdfgh():
	Inentary.inven.append(Inentary.Objetos.TRAUMA)
	print_data()
	D.metertexto(["¿sdfgh?","i6","i7"],"she")
	await D.FIN
	D.metertexto(["d6","d7"],"yo")
	await D.FIN
	D.metertexto(["fuck"])
	await D.FIN
	Seales.moverte=true
	

