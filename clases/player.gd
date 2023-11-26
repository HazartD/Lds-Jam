class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
@onready var ray:RayCast2D=$CollisionShape2D/RayCast2D
const SPEED = 300.0
var input_vector = Vector2.ZERO

@export_enum("DOWN","UP","RIGHT","LEFT") var Est_Act=0:
	set(value):
		print("estado era ",Est_Act)
		Est_Act=value
		print(" y paso a ",Est_Act)

func _ready():
#	$Cam.make_current()
	print("readyado,player,estado: "+str(Est_Act))
	match Est_Act:
		0:pass
		1:ray.rotation_degrees=180
		2:
			ray.target_position.y=18
			ray.rotation_degrees=270
		3:
			ray.target_position.y=18
			ray.rotation_degrees=90
	$in_game/cordura.value=Progresos.progresion["cordura"]

func update_bar(val:int=1):
	Progresos.progresion["cordura"]-=val
	print("cordura",Progresos.progresion["cordura"])
	$in_game/cordura.value=Progresos.progresion["cordura"]
	if Progresos.progresion["cordura"] <= 0 and Progresos.mode==0:
		Progresos.mode=Progresos.cambio_mode.AFTER
		$Cam.shake(0.2,10,1)
		Seales.change.emit()
	var sha=(10.0/Progresos.progresion["cordura"])*10.0
	print(sha)
	if sha in range(10,100):$Cam.shake(1.0,sha,sha)

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
		elif event.is_action_pressed("ui_down"):
			ray.rotation_degrees=0
			ray.target_position.y=11
			Est_Act=0
			$gil.play("down")
		if event.is_action_pressed("ui_up"):
			ray.rotation_degrees=180
			ray.target_position.y=11
			Est_Act=1
			$gil.play("up")
		elif event.is_action_pressed("ui_right"):
			ray.rotation_degrees=270
			ray.target_position.y=18
			Est_Act=2
			$gil.play("right")
		elif event.is_action_pressed("ui_left"):
			ray.rotation_degrees=90
			ray.target_position.y=18
			Est_Act=3
			$gil.play("letf")


func save():
	var saver={"parent":get_parent().get_path(),
	"filename":get_scene_file_path(),
	"position:x":position.x,"position:y":position.y,
	"Est_Act":Est_Act}
	return saver



func _on_gil_animation_finished():
	if input_vector==Vector2.ZERO:
		match  Est_Act:
			0:$gil.play("down_idle")
			1:$gil.play("up_idle")
			2:$gil.play("right_idle")
			3:$gil.play("letf_idle")
	else:$gil.play($gil.animation)
