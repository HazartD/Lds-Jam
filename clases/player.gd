class_name Player extends CharacterBody2D
const SPEED = 300.0
enum Estado{IDEL,MOVIENDOSE}
var est_act:Estado=Estado.IDEL
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
	if event.is_action_pressed("ui_down"):
		$RayCast2D.rotation_degrees=0
	if event.is_action_pressed("ui_right"):
		$RayCast2D.rotation_degrees=270
	if event.is_action("ui_left"):
		$RayCast2D.rotation_degrees=90
	
	if event.is_action_pressed("ui_accept"):
		$RayCast2D.get_collider().interaccion.emit()


