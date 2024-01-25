extends Node
func _on_tree_entered():
	print("liminal en arbol")
func _ready():
	await get_tree().create_timer(0.01).timeout
	print("liminal raydeado")
	var nex= load(Seales.esenes[Seales.nex])
	var next=nex.instantiate()
	add_sibling(next)
	queue_free()




func _on_tree_exited():
	print("liminal fuera del arbol")
