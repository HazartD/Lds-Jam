class_name Player extends CharacterBody2D
const menu=preload("res://UI/inventorymenu.tscn")
const SPEED = 300.0
@export_enum("IDELDOWN","IDELUP","IDELRIGHT","IDELLEFT","MOVIENDOSE") var Est_Act:int=0
func _ready():
	print("readyado,player,estado: "+str(Est_Act))
	match Est_Act:
		0:pass
		1:$CollisionShape2D/RayCast2D.rotation_degrees=180
		2:$CollisionShape2D/RayCast2D.rotation_degrees=270
		3:$CollisionShape2D/RayCast2D.rotation_degrees=90



func _process(_delta):
	if Seales.moverte:
		get_input()
	move_and_slide()




func get_input():
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction*SPEED



func _input(event):
	if Seales.moverte:
		if event.is_action_pressed("ui_up"):
			$CollisionShape2D/RayCast2D.rotation_degrees=180
			Est_Act=1
		elif event.is_action_pressed("ui_down"):
			$CollisionShape2D/RayCast2D.rotation_degrees=0
			Est_Act=0
		elif event.is_action_pressed("ui_right"):
			$CollisionShape2D/RayCast2D.rotation_degrees=270
			Est_Act=2
		elif event.is_action_pressed("ui_left"):
			$CollisionShape2D/RayCast2D.rotation_degrees=90
			Est_Act=3
		
		if event.is_action_pressed("ui_accept"):
			if $CollisionShape2D/RayCast2D.is_colliding():if $CollisionShape2D/RayCast2D.get_collider().has_signal("interaccion"):$CollisionShape2D/RayCast2D.get_collider().interaccion.emit()
		if event.is_action_pressed("ui_cancel"):
			var vermenu=menu.instantiate()
			add_sibling(vermenu)



func save():
	var saver={"parent":get_parent().get_path(),
	"filename":get_scene_file_path(),
	"position:x":position.x,"position:y":position.y,
	"Est_Act":Est_Act}
	return saver

