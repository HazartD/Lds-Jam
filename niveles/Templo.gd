extends escenario
enum hechos{LLEGADA_1,LLEGADA_2,LLEGADA_3,LLEGADA_4,LLEGADA_5,LLEGADA_6,LLEGADA_REQUESON}
func save():
	var saver={"parent":get_parent().get_path(),"filename":get_scene_file_path()}
	return saver
func _ready():
	techos=[$Node2D/Sprite2D]
	$back.finished.connect(func():$back.play())
	play=$player



func entro(_body):
	if Progresos.dia_es==1:Progresos.hecho["templo"].append(hechos.LLEGADA_1)
	elif Progresos.dia_es==2:Progresos.hecho["templo"].append(hechos.LLEGADA_2)
	elif Progresos.dia_es==3:Progresos.hecho["templo"].append(hechos.LLEGADA_3)
	elif Progresos.dia_es==4:Progresos.hecho["templo"].append(hechos.LLEGADA_4)
	elif Progresos.dia_es==5:Progresos.hecho["templo"].append(hechos.LLEGADA_5)
	elif Progresos.dia_es==6:Progresos.hecho["templo"].append(hechos.LLEGADA_6)
	else:Progresos.hecho["templo"].append(hechos.LLEGADA_REQUESON)
	print("templo tiene: ",Progresos.hecho["templo"])
	
	
	
#	if !Progresos.hecho["templo"].has(hechos.LLEGADA_1) and Progresos.dia_es == 1:Progresos.hecho["templo"].append(hechos.LLEGADA_1)
#	else: if Progresos.hecho["templo"].has(hechos.LLEGADA_2):Progresos.hecho["templo"].append(hechos.LLEGADA_2)
