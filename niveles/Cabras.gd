extends Node2D
var num:int=0
func _process(_delta):
	num+=1
	$Label.text=str(num)

#func _on_static_body_2d_interaccion():
#	print("a")
#	set_process(false)
#	dial=["d1","d2","d3"]
#	dialname="name"
#	metertexto()
