extends Area2D
@onready var animation_player = $AnimationPlayer

func Trigger_Press():
	animation_player.play("Open Door")
