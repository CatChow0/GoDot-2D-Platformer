extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var pressure_plate = $"."

func _on_body_entered(body):
	if body is Player:
		var worldNode = pressure_plate.get_parent()
		var doorNode = worldNode.get_node("Door")
		doorNode.Trigger_Press()
		animation_player.play("Pressed")

func on_player_dead_plate():
	var worldNode = pressure_plate.get_parent()
	var doorNode = worldNode.get_node("Door")
	doorNode.on_player_dead_door()
	animation_player.play_backwards("Pressed")
