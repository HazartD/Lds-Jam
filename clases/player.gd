class_name Player extends Entidad
var mover:bool=true
const SPEED = 300.0
func _process(_delta):
	if mover:
		get_input()
	move_and_slide()
func get_input():
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction*SPEED
func _input(event):
	if event.is_action("ui_up"):
		$RayCast2D.rotation_degrees=180
	if event.is_action("ui_down"):
		$RayCast2D.rotation_degrees=0
	if event.is_action("ui_right"):
		$RayCast2D.rotation_degrees=270
	if event.is_action("ui_left"):
		$RayCast2D.rotation_degrees=90

	if event.is_action("ui_accept"):
		if $RayCast2D.get_collider() is Elemento:
			pass
