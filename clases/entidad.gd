class_name Entidad extends CharacterBody2D
signal interaccion

func save()->Dictionary:
	var saver={"parent":get_parent(),"filename":get_scene_file_path(),"positionY":position.y,"positionX":position.y}
	return saver
