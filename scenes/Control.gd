extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_save_pressed() -> void:
	_save()
	$LineEdit.clear()
	print("GAME SAVED")
	



func _on_button_load_pressed():
	_load()
	print("GAME LOADED")
	
func _save() -> void:
	var save_file = FileAccess.open("saveFile", FileAccess.WRITE)
	
	var save_nodes = get_tree().get_nodes_in_group("SaveLoad")
	for node in save_nodes:
		if !node.has_method("SaveObject"):
			print("Node '%s' is missing a save function, skipped" % node.name)
			continue
		var node_data = node.call("saveObject")
		
		save_file.store_line(JSON.stringify(node_data))
	
	save_file.close() # Close File

func _load() -> void:
	# Check if the SaveFile exists
	if !FileAccess.file_exists("saveFile"):
		print("Error, no Save File to load.")
		return
		
	var save_file = FileAccess.open("saveFile", FileAccess.READ) # Open File
	
	while save_file.get_position() < save_file.get_length():
		# Get the saved dictionary from the next line in the save file
		var json = JSON.new()
		json.parse(save_file.get_line())
		
		# Get the Data
		var node_data = json.get_data()
		if has_node(node_data["filepath"]):
			get_node(node_data["filepath"]).loadObject(node_data)
			
	save_file.close() # Close File
