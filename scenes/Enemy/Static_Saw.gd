extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.animation = "default"

func _on_body_entered(body):
	if body is Player:
		body.hurt()
