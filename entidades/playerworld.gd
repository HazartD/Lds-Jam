extends Player
func _ready():
	print("readyado,player,estado: "+str(Est_Act))
func update_bar(val:int=1):
	Progresos.progresion["cordura"]-=val
	print("cordura",Progresos.progresion["cordura"])
	$in_game/cordura.value=Progresos.progresion["cordura"]
	var sha=(10.0/Progresos.progresion["cordura"])*10.0
	if sha <101:$Cam.shake(1.0,sha,sha)
	if Progresos.progresion["cordura"] <= 0 and Progresos.mode==0:
		Progresos.mode=Progresos.cambio_mode.AFTER
		$Cam.shake(0.2,10,1)
		Seales.change.emit()
	print(sha)
func save():
	var saver={"parent":get_parent().get_path(),
	"filename":get_scene_file_path(),
	"position:x":position.x,"position:y":position.y,
	"Est_Act":Est_Act}
	return saver
