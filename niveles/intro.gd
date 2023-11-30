extends escenario
func _ready():
	$player.Est_Act=1

func _on_area_2d_body_entered(body):
	print("player positiom",body.position.x)
	if body.position.x<0:body.position.x=-body.position.x-40
	else:body.position.x=-body.position.x+40

func _on_area_2d_2_body_entered(_body):
	print("activo escena intro")
	await D.metertexto(["0i1","0i2"],"f1")
	await D.metertexto(["0i3","0i4"],"f2")
	Seales.dia_in()
