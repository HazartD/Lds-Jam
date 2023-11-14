extends CanvasLayer
const opcion=preload("res://UI/opciones.tscn")
var opci:bool=false
func _ready():
	$Control/HBC/VBC/guardar.grab_focus()
	get_tree().set_pause(true)
	add_items()
	for child in get_tree().get_nodes_in_group("boton"):
		child.focus_entered.connect(func(): get_node("/root/UiSong/focus").play())
		child.mouse_entered.connect(func(): get_node("/root/UiSong/focus").play())


func _on_guardar_button_down():
	Save.save_g()
	queue_free()
#antes iba a hacer que se pueda cargar desde aqui pero como hacen queuefree no se borran hasta
#que termina toda la funcion(si no se hace asi falla) se crea el nodo con otro nombre y ya no funciona el nodepath xd


func _on_button_button_down():
	get_tree().quit()


func _input(event):
	if event.is_action_pressed("ui_cancel") and !opci:
		queue_free()


func _on_tree_exiting():
	get_tree().paused=false

func opexit():
	$Control/HBC/VBC/opciones.grab_focus()
	opci=false

	
func _on_opciones_button_down():
	var opin=opcion.instantiate()
	add_child(opin)
	opci=true
	opin.connect("tree_exiting",opexit)
func add_items():
	for i in Inentary.inven:
		var e:String
		match i:
			0: e="res://placeholder.png"
			1: e="res://placeholder.png"
			2: e="res://placeholder.png"
			3: e="res://placeholder.png"
		$Control/HBC/SC/IL.add_item(tr(e),load(e))


