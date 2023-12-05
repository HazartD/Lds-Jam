class_name puerta extends Elemento
@export var dentro:bool=true
@export var number:int
@onready var pater:escenario=get_node("..")
func _init():
	interaccion.connect(_on_interaccion)
func _on_interaccion():
	dentro=!dentro
	pater.puertar(number,dentro)
