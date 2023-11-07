extends Node2D

func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path()}
	return saver
