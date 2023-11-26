extends Node
signal change
signal DIA_CAMBIO
signal ESCENA_CAMBIO
var moverte:bool=true:
	set(value):
		print("moverte paso de ",moverte," a ", value)
		moverte=value
@onready var colo=get_node("/root/main/Cambio/solid")
@onready var lay=get_node("/root/main/Cambio")
const liminal=preload("res://clases/liminal.tscn")
const shaders=[preload("res://img/Shaders/invert.gdshader"),preload("res://img/Shaders/repit.gdshader")]
const esenes=["res://niveles/Templo.tscn"]

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
	t.tween_property(colo,"color:a",1,3)
	print(Progresos.dia_es)
	Progresos.dia_es=(Progresos.dia_es+1 as Progresos.DIA)
	await t.finished
	print(Progresos.dia_es)
	DIA_CAMBIO.emit()
func dia_out():
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,3)
	await te.finished
	lay.set_layer(-10)

func esencam_in(scene:int):
	nex=scene
	Seales.moverte=false
	match scene:
		0:colo.color=Color(1,0,0,0)
	lay.set_layer(11)
	var t=get_tree().create_tween()
	t.tween_property(colo,"color:a",1,3)
	await t.finished
	ESCENA_CAMBIO.emit()
func esencam_out():
	var te=get_tree().create_tween()
	te.tween_property(colo,"color:a",0,3)
	await te.finished
	Seales.moverte=true
	lay.set_layer(-10)
