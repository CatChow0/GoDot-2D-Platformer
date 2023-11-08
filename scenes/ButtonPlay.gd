extends Button

var scene = preload("res://scenes/main.tscn")
var instance = scene.instantiate()

func _on_pressed():
	add_child(instance)
