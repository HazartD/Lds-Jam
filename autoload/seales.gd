extends Node
signal change
signal DIA_CAMBIO
signal ESCENA_CAMBIO
var moverte:bool=true
@onready var colo:ColorRect=get_node("/root/main/Cambio/solid")
@onready var lay:CanvasLayer=get_node("/root/main/Cambio")
const liminal=preload("res://clases/liminal.tscn")
const shaders=[preload("res://img/Shaders/invert.gdshader"),preload("res://img/Shaders/repit.gdshader")]
const esenes=["res://niveles/intro.tscn","res://niveles/Templo.tscn","res://niveles/Cabra.tscn"]
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
	lay.set_layer(11)
	colo.color=Color(0,0,0,0)
	var t=get_tree().create_tween()
	t.tween_property(colo,"color:a",1,2)
	print(Progresos.dia_es)
	Progresos.dia_es=(Progresos.dia_es+1 as Progresos.DIA)
	await t.finished
	print(Progresos.dia_es)
#	nex=randi_range(0,4)
	DIA_CAMBIO.emit()
func dia_out():
	await get_tree().create_timer(1).timeout
	var day=load("res://clases/interdias.tscn")
	var next=day.instantiate()
	get_node("/root/main").add_child(next)
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,2)
	await te.finished
	lay.set_layer(-10)

func esencam_in(scene:int):
	nex=scene
	lay.set_layer(11)
	Seales.moverte=false
	match scene:
		0:colo.color=Color(1,1,1,0)
		1:colo.color=Color(1,0,0,0)
		2:colo.color=Color(0.87,0,0.74,0)
	var t=get_tree().create_tween()
	t.tween_property(colo,"color:a",1,2)
	await t.finished
	ESCENA_CAMBIO.emit()
func esencam_out():
	await get_tree().create_timer(1).timeout
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,2)
	await te.finished
	Seales.moverte=true
	lay.set_layer(-10)
