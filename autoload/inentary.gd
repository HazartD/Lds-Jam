extends Node
enum objetos {}
var  inven=["","",""]
func save()->Dictionary:
	var saver ={"parent":get_parent().get_path(),"filename":get_scene_file_path(),"inven":inven}
	return saver
