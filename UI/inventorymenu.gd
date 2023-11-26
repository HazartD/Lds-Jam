extends Control
const opcion=preload("res://UI/opciones.tscn")
var opci:bool=false
const img:PackedStringArray=["res://placeholder.png","res://img/fondo nivel/cabra_test.jpg","res://placeholder.png","res://img/fondo nivel/cabra_test.jpg","res://placeholder.png"]
func _ready():
	set_visible(false)
	for child in get_tree().get_nodes_in_group("boton"):
		child.focus_entered.connect(func(): get_node("/root/UiSong/focus").play())
		child.mouse_entered.connect(func():child.grab_focus())
		$Label.text=str(Progresos.save())


func _on_guardar_button_down():
	Save.save_g()
	queue_free()
#antes iba a hacer que se pueda cargar desde aqui pero como hacen queuefree no se borran hasta
#que termina toda la funcion(si no se hace asi falla) se crea el nodo con otro nombre y ya no funciona el nodepath xd
func _on_button_button_down():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel") and !opci:
		set_visible(!visible)

func opexit():
	$HBC/VBC/opciones.grab_focus()
	opci=false

func _on_opciones_button_down():
	var opin=opcion.instantiate()
	add_child(opin)
	opci=true
	opin.connect("tree_exiting",opexit)

func add_items():
	for i in Progresos.progresion["inven"]:
		$HBC/SC/IL.add_item(tr(str(i)),load(img[i]))

func _on_visibility_changed():
	if visible:
		Seales.moverte=false
		$HBC/VBC/guardar.grab_focus()
		get_tree().set_pause(true)
		add_items()
		print("visibelido")
	else:
		get_tree().set_pause(false)
		$HBC/SC/IL.clear()
		Seales.moverte=true
		print("invisibelido")
