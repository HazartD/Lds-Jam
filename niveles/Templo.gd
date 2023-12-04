extends escenario
func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path()}
	return saver
func _ready():
	$back.finished.connect(func():$back.play())
	print("templo reydeado")
func _on_tree_entered():
	print("templo en el arbol")


func _on_tree_exited():
	print("templo fuera del arbol")

