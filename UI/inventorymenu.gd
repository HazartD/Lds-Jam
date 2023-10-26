extends CanvasLayer
const testu = preload("res://placeholder.png")
func _ready():
	$Control/HBC/VBC/guardar.grab_focus()
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	$Control/HBC/SC/IL.add_item("r",load("res://placeholder.png"))
	Save.cargado.connect(cargo)
	get_tree().set_pause(true)


func _on_guardar_button_down():
	Save.save_g()
	queue_free()
func _on_cargar_button_down():
	Save.load_g()
	queue_free()


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
