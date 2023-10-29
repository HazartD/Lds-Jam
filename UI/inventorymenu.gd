extends CanvasLayer
const testu = preload("res://placeholder.png")
const opcion=preload("res://UI/opciones.tscn")
func _ready():
	$Control/HBC/VBC/guardar.grab_focus()
	Save.cargado.connect(cargo)
	get_tree().set_pause(true)


func _on_guardar_button_down():
	Save.save_g()
	queue_free()
	#antes iba a hacer que se pueda cargar desde aqui pero como hacen queuefree no se borran hasta que termina toda la funcion(si no se hace asi falla) se crea el nodo con otro nombre y ya no funciona el nodepath xd
	

func _on_button_button_down():
	Seales.cambio_menumain.emit()
	get_tree().change_scene_to_file("res://UI/menuinicio.tscn")


func cargo():
	queue_free()
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		queue_free()


func _on_tree_exiting():
	get_tree().paused=false


func _on_opciones_button_down():
	var opin=opcion.instantiate()
	add_child(opin)
