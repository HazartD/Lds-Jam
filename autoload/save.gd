extends Node
signal guardado
signal cargado
var NombrePartida:String="/Slot%s.txt"
var dir= DirAccess.open("user://")
func _init():
	DirAccess.make_dir_absolute("user://HazartD/7DNA")
	dir=DirAccess.open("user://HazartD/7DNA")
func save_g():
	var save_game = FileAccess.open(NombrePartida, FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			break
		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		save_game.store_line(json_string)
	save_game.close()
	guardado.emit()

func load_g():
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

		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		if node_data.has("position:x") and node_data.has("position:y"):
			new_object.position = Vector2(node_data["position:x"], node_data["position:y"])
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "position:x" or i == "position:y":
				continue
			new_object.set(i, node_data[i])
	cargado.emit()
