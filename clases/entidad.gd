class_name Entidad extends CharacterBody2D
signal interaccion
@export var mueve:bool=false
func _ready():
	add_to_group("entidad",true)
	if mueve: add_to_group("Persist")
	self.tree_exited.connect(frre)

func frre():
	remove_from_group("Persist")

func save()->Dictionary:
	var saver={"parent":get_parent(),"filename":get_scene_file_path(),"positionY":position.y,"positionX":position.y}
	return saver
