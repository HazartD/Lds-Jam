extends Control
const botoncargar= preload("res://UI/cargar.tscn")

var dir= DirAccess.open("user://")
func _ready():
	TranslationServer.set_locale(Config.locali)
	dir.make_dir_absolute("user://HazartD/7DNA")
	dir=DirAccess.open("user://HazartD/7DNA")
	$VBoxContainer/Cargar.grab_focus()

func _on_nueva_partida_button_down():
	Save.NombrePartida="/Slot%s.txt" %Config.parti
	while FileAccess.file_exists(dir.get_current_dir()+Save.NombrePartida):
		Config.parti+=1
		Save.NombrePartida="/Slot%s.txt" %Config.parti
	print(Save.NombrePartida)
	var file = FileAccess.open(dir.get_current_dir()+Save.NombrePartida, FileAccess.WRITE)
	print(FileAccess.get_open_error())
	file.close()
	get_tree().change_scene_to_file("res://niveles/Cabra.tscn")
	Config.parti=+1
	print(dir.get_current_dir())


func _on_nueva_partida_2_button_down():
	$ScrollContainer.show()
	$VBoxContainer.hide()
	$Button.show()
	var files=DirAccess.open("user://").get_files()
	for fi in files:
		var bon=botoncargar.instantiate()
		bon.text=fi
		$ScrollContainer/VBoxContainer.add_child(bon)
	$ScrollContainer/VBoxContainer.get_child(0).grab_focus()
	
	$ScrollContainer/VBoxContainer.get_children()
	
	print(files)
#creo que puedo usar el child count para tener el numero de nodos y luego el children y el child
#para iterarlos
#tal parece que con hacer que grab focus el primero los demasya lo toman


func _on_button_button_down():
	$ScrollContainer.hide()
	$VBoxContainer.show()
	$Button.hide()
