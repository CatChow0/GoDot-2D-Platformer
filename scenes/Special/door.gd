extends StaticBody2D
class_name Door

@onready var animation_player = $AnimationPlayer

func Trigger_Press():
	animation_player.play("Open Door")

func on_player_dead_door():
	animation_player.play_backwards("Open Door")
