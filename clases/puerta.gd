class_name puerta extends Elemento
@export var dentro:bool=true
@onready var pater:escenario=get_node("..")
func _init():
	interaccion.connect(_on_interaccion)
func _on_interaccion():
	dentro=!dentro
	pater.puertar(number,int(dentro))
