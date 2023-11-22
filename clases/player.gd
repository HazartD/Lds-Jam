class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
const valuel:PackedStringArray=["cordura","Nlife"]
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
	$in_game/Control/towake.value=Progresos.progresion["Nlife"]

func update_bar(ind:int,val:int=1):
	Progresos.progresion[valuel[ind]]-=val
	print(valuel[ind],Progresos.progresion[valuel[ind]])
	$in_game/Control/cordura.value=Progresos.progresion["cordura"]
	$in_game/Control/towake.value=Progresos.progresion["Nlife"]
	if Progresos.progresion["cordura"] <= 0 and Progresos.mode==0:
		Progresos.mode=Progresos.cambio_mode.AFTER
		Seales.change.emit()
		return
	if Progresos.progresion["Nlife"]<=0:
		Progresos.dia_es=Progresos.dia_es+1
		Seales.DIA_CAMBIO.emit()
		print("dia ",Progresos.dia_es)
		return
	var sha=(10.0/Progresos.progresion[valuel[ind]])*10.0
	print(sha)
	$Cam.shake(1.0,sha,sha)



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

