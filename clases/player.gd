class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
const SPEED = 300.0
enum Estado{IDELDOWN,IDELUP,IDELRIGHT,IDELLEFT,MOVIENDOSE}
var est_act:Estado=Estado.IDELDOWN
func _process(_delta):
	if Seales.moverte:
		get_input()
	move_and_slide()
func get_input():
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction*SPEED
func _input(event):
	if event.is_action_pressed("ui_up"):
		$RayCast2D.rotation_degrees=180
	elif event.is_action_pressed("ui_down"):
		$RayCast2D.rotation_degrees=0
	elif event.is_action_pressed("ui_right"):
		$RayCast2D.rotation_degrees=270
	elif event.is_action("ui_left"):
		$RayCast2D.rotation_degrees=90
	
	if event.is_action_pressed("ui_accept"):
		if $RayCast2D.is_colliding():$RayCast2D.get_collider().interaccion.emit()
	if event.is_action_pressed("ui_cancel"):
		var vermenu=menu.instantiate()
		add_sibling(vermenu)

	

func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path(),"position:x":position.x,"position:y":position.y,"est_act":est_act}
	return saver

