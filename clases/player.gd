class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
@onready var ray:RayCast2D=$CollisionShape2D/RayCast2D
const SPEED = 300.0
@export_enum("IDELDOWN","IDELUP","IDELRIGHT","IDELLEFT","MOVIENDOSE") var Est_Act:int=0
func _ready():
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
	$in_game/Control/cordura.value=Progresos.progresion["cordura"]

func update_bar(val:int=1):
	Progresos.progresion["cordura"]-=val
	print("cordura",Progresos.progresion["cordura"])
	$in_game/Control/cordura.value=Progresos.progresion["cordura"]
	if Progresos.progresion["cordura"] <= 0 and Progresos.mode==0:
		Progresos.mode=Progresos.cambio_mode.AFTER
		Seales.change.emit()
	var sha=(10.0/Progresos.progresion["cordura"])*10.0
	print(sha)
	if sha in range(10,100):$Cam.shake(1.0,sha,sha)

func _physics_process(_delta):
	if Seales.moverte:
		get_input()
	move_and_slide()




func get_input():
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction*SPEED



func _input(event):
	if Seales.moverte:
		if event.is_action_pressed("ui_up"):
			ray.rotation_degrees=180
			ray.target_position.y=11
			Est_Act=1
		elif event.is_action_pressed("ui_down"):
			ray.rotation_degrees=0
			ray.target_position.y=11
			Est_Act=0
		elif event.is_action_pressed("ui_right"):
			ray.rotation_degrees=270
			ray.target_position.y=18
			Est_Act=2
		elif event.is_action_pressed("ui_left"):
			ray.rotation_degrees=90
			ray.target_position.y=18
			
			Est_Act=3
		
		if event.is_action_pressed("ui_accept"):
			if ray.is_colliding():if ray.get_collider().has_signal("interaccion"):ray.get_collider().interaccion.emit()
		if event.is_action_pressed("ui_cancel"):
			var vermenu=menu.instantiate()
			add_sibling(vermenu)



func save():
	var saver={"parent":get_parent().get_path(),
	"filename":get_scene_file_path(),
	"position:x":position.x,"position:y":position.y,
	"Est_Act":Est_Act}
	return saver

