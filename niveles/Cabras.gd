extends Node2D
var num:int=0
const player= preload("res://entidad/player.tscn")
func _init():
	Seales.ESCENA_CAMBIO.connect(cam)
	

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
	D.metertexto("yo",["d1","d2","d3"])
	await D.FIN
	print("si")
	D.metertexto("she",["i1","i2","i3"])
	await D.FIN
	print("segundo")

