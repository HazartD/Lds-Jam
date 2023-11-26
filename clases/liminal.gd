extends Node
func _ready():
	var nex= load(Seales.esenes[Seales.nex])
	var next=nex.instantiate()
	add_sibling(next)
	queue_free()
