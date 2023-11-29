extends Node2D
func _ready():
	$player.Est_Act=1
	Seales.DIA_CAMBIO.connect(cambidia)

func _on_area_2d_body_entered(body):
	print(body.position.x)
	if body.position.x<0:body.position.x=-body.position.x-40
	else:body.position.x=-body.position.x+40


func _on_area_2d_2_area_entered(_body):
	Seales.dia_in()
func cambidia():
	var li=Seales.liminal.instantiate()
	add_sibling(li)
	queue_free()
