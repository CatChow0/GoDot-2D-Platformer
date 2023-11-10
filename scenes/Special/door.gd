extends StaticBody2D
class_name Door

@onready var animation_player = $AnimationPlayer

func Trigger_Press():
	animation_player.play("Open Door")
