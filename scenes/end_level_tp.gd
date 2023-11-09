extends Node2D

const File_Begin = "res://scenes/level/level"

func _on_area_2d_body_entered(body):
	if body is Player:
		go_to_next_level()

func go_to_next_level() :
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	
	var next_level_path = File_Begin + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
