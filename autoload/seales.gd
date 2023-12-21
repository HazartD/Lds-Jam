extends Node
signal change
signal DIA_CAMBIO
signal ESCENA_CAMBIO
var moverte:bool=true
@onready var colo:ColorRect=get_node("/root/main/Cambio/solid")
@onready var lay:CanvasLayer=get_node("/root/main/Cambio")
const liminal=preload("res://clases/liminal.tscn")
const shaders=[preload("res://img/Shaders/invert.gdshader"),preload("res://img/Shaders/repit.gdshader")]
const esenes=["res://niveles/intro.tscn","res://niveles/Templo.tscn","res://niveles/Cabra.tscn","res://niveles/Missing_Cock.tscn"]
var nex:int

func _init():
	change.connect(after)
	DIA_CAMBIO.connect(dia_out)
	ESCENA_CAMBIO.connect(esencam_out)
func after():
	if Progresos.mode==Progresos.cambio_mode.AFTER:
		for node in get_tree().get_nodes_in_group("invert"):
			node.material.shader=shaders[0]
		for nod in get_tree().get_nodes_in_group("repit"):
			nod.material.shader=shaders[1]

func dia_in():
	Seales.moverte=false
	lay.set_visible(true)
	lay.set_layer(11)
	colo.color=Color(0,0,0,0)
	var t=get_tree().create_tween()
	t.tween_property(colo,"color:a",1,2)
	print("dias fue",Progresos.dia_es)
	Progresos.dia_es=(Progresos.dia_es+1 as Progresos.DIA)
	print("dia es",Progresos.dia_es)
	await t.finished
#	nex=randi_range(0,4)
	DIA_CAMBIO.emit()
func dia_out():
	var day=load("res://clases/interdias.tscn")
	var reday=day.instantiate()
	get_node("/root/main").add_child(reday)
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,2)#.set_delay(0.5)
	await te.finished
	lay.set_visible(false)
	lay.set_layer(-10)

func esencam_in(scene:int):
	nex=scene
	lay.set_visible(true)
	lay.set_layer(11)
	Seales.moverte=false
	match scene:
		0:colo.color=Color(1,1,1,0)
		1:colo.color=Color(1,0,0,0)
		2:colo.color=Color(0.87,0,0.74,0)
		3:colo.color=Color(0.92,0.81,0,0)
	var t=get_tree().create_tween()
	t.tween_property(colo,"color:a",1,2)
	await t.finished
	ESCENA_CAMBIO.emit()
	var lin=liminal.instantiate()
	get_node("/root/main").add_child(lin)
func esencam_out():
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,2)#.set_delay(0.5)
	await te.finished
	Seales.moverte=true
	lay.set_visible(false)
	lay.set_layer(-10)
