extends Node
signal guardado
signal cargado
var NombrePartida:String="/Slot%s.txt"
var dir= DirAccess.open("user://")
func _init():
	DirAccess.make_dir_recursive_absolute("user://HazartD/7DNA/saves")
	
func save_g():
	
	dir=DirAccess.open("user://HazartD/7DNA/saves")
	var save_game = FileAccess.open(NombrePartida, FileAccess.WRITE)
	var datajson=JSON.stringify(Progresos.save())
	save_game.store_line(datajson)
	print(Progresos.save())
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	print(save_nodes)
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		print(node.name)
		var node_data = node.call("save")
		print(node.name+"tiene:"+str(node_data))
		
		var json_string = JSON.stringify(node_data)
		save_game.store_line(json_string)
	
	save_game.close()
	guardado.emit()

func load_g():
	dir=DirAccess.open("user://HazartD/7DNA/saves")
	if not FileAccess.file_exists(NombrePartida):
		return

	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	var saved_game = FileAccess.open(NombrePartida, FileAccess.READ)
	while saved_game.get_position() < saved_game.get_length():
		var dato = saved_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(dato)
		if not parse_result == OK:
			continue
		var node_data = json.get_data()
		if node_data.has("p"):
			print("guardado:",node_data)
			for i in node_data.keys():Progresos.set(i,node_data[i])
			print("cargado: ",Progresos.save())
			continue

		var new_object = load(node_data["filename"]).instantiate()
		print(new_object,":instiado")
		get_node(node_data["parent"]).add_child(new_object)
		print("su parent es:",new_object.get_parent().name)
		if node_data.has("position:x") and node_data.has("position:y"):
			new_object.position = Vector2(node_data["position:x"], node_data["position:y"])
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "position:x" or i == "position:y" or i == "p":continue
			new_object.set(i, node_data[i])
		new_object._ready()
	cargado.emit()

