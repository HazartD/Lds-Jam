extends Node
signal change
signal DIA_CAMBIO
signal ESCENA_CAMBIO
var moverte:bool=true
const shaders=[preload("res://img/Shaders/invert.gdshader"),preload("res://img/Shaders/repit.gdshader")]
func _init():
	change.connect(after)
func after():
	if Progresos.mode==Progresos.cambio_mode.AFTER:
		for node in get_tree().get_nodes_in_group("invert"):
			node.material.shader=shaders[0]
		for nod in get_tree().get_nodes_in_group("repit"):
			nod.material.shader=shaders[1]
