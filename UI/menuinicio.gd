extends Control
const botoncargar= preload("res://UI/cargar.tscn")
const option=preload("res://UI/opciones.tscn")
var dir=DirAccess.open("user://HazartD/7DNA/saves")

func _ready():
	Config.carg()
	Save.cargado.connect(func(): queue_free())
	hay_archi()
	if FileAccess.file_exists("user://HazartD/7DNA/Config_and_data.ini"):$Panel.free()
	else:
		$VBoxContainer.hide()
		$Panel/en.grab_focus()
	for child in get_tree().get_nodes_in_group("boton"):
		child.focus_entered.connect(func(): get_node("/root/UiSong/focus").play())
		child.mouse_entered.connect(func(): get_node("/root/UiSong/focus").play())

func _input(event):
	if event.is_action_pressed("ui_cancel"):if $Button.disabled==false: _on_button_button_down()


func _on_nueva_partida_button_down():
	var parti:int=0
	Save.NombrePartida="user://HazartD/7DNA/saves/Slot%s.txt" %parti
	while FileAccess.file_exists(Save.NombrePartida):
		parti+=1
		Save.NombrePartida="user://HazartD/7DNA/saves/Slot%s.txt" %parti
	print(Save.NombrePartida)
	get_tree().change_scene_to_file("res://niveles/Cabra.tscn")
	Seales.ESCENA_CAMBIO.emit()


func _on_nueva_partida_2_button_down():
	$ScrollContainer.show()
	$VBoxContainer.hide()
	$Button.show()
	$Button.disabled=false
	var files=dir.get_files()
	if !files:
		return
	for fi in files:
		var bon=botoncargar.instantiate()
		bon.text=fi
		$ScrollContainer/VBoxContainer.add_child(bon)
	$ScrollContainer/VBoxContainer.get_child(0).grab_focus()
	
	#$ScrollContainer/VBoxContainer.get_children()
	#creo que puedo usar el child count para tener el numero de nodos y luego el children y el child
	#para iterarlos
	#tal parece que con hacer que grab focus el primero los demasya lo toman


func _on_button_button_down():
	$ScrollContainer.hide()
	$VBoxContainer.show()
	$Button.hide()
	$Button.disabled=true
	$VBoxContainer/Cargar.grab_focus()



func _on_exit_button_down():
	get_tree().quit()


func _on_es_down():
	selec_locale("es")
func _on_en_down():
	selec_locale("en")


func selec_locale(locale:String):
	TranslationServer.set_locale(locale)
	Config.guar()
	$Panel.queue_free()
	$VBoxContainer.show()
	hay_archi()



func hay_archi():
	var files=dir.get_files()
	if !files:
		$VBoxContainer/Cargar.set_disabled(true)
		$VBoxContainer/nueva.grab_focus()
	else:$VBoxContainer/Cargar.grab_focus()

func _on_options_button_down():
	var op=option.instantiate()
	add_child(op)
	op.connect("tree_exiting",func():$VBoxContainer/options.grab_focus())
