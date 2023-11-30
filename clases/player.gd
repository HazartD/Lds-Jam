class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
@onready var ray:RayCast2D=$CollisionShape2D/RayCast2D
const SPEED = 300.0
var input_vector = Vector2.ZERO
@export_enum("DOWN","UP","RIGHT","LEFT") var Est_Act=0:
	set(value):
		Est_Act=value
		match value:
			0:
				ray.rotation_degrees=0
				ray.target_position.y=9
			1:
				ray.rotation_degrees=180
				ray.target_position.y=9
			2:
				ray.rotation_degrees=270
				ray.target_position.y=16
			3:
				ray.rotation_degrees=90
				ray.target_position.y=16

func _physics_process(_delta):
	if Seales.moverte:
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		#gracias a xXtumbaBurrasXx del discord de godot por la idea
		velocity=input_vector*SPEED
		move_and_slide()

func _input(event):
	if Seales.moverte:
		if event.is_action_pressed("ui_accept"):
			if ray.is_colliding():if ray.get_collider().has_signal("interaccion"):ray.get_collider().interaccion.emit()
		if event.is_action_pressed("ui_down"):set_down()
		elif event.is_action_pressed("ui_up"):set_up()
		elif event.is_action_pressed("ui_right"):set_right()
		elif event.is_action_pressed("ui_left"):set_left()
		if event.is_released():
			if Input.is_action_pressed("ui_down"):set_down()
			if Input.is_action_pressed("ui_up"):set_up()
			if Input.is_action_pressed("ui_right"):set_right()
			if Input.is_action_pressed("ui_left"):set_left()

func set_down():
	Est_Act=0
	$gil.play("down")
func set_up():
	Est_Act=1
	$gil.play("up")
func set_right():
	Est_Act=2
	$gil.play("right")
func set_left():
	Est_Act=3
	$gil.play("letf")
func _on_gil_animation_finished():
	if input_vector==Vector2.ZERO:
		match  Est_Act:
			0:$gil.play("down_idle")
			1:$gil.play("up_idle")
			2:$gil.play("right_idle")
			3:$gil.play("letf_idle")
	else:$gil.play($gil.animation)
