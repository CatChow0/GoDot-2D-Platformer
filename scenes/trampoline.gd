extends Area2D
@onready var animation_player = $AnimationPlayer

var Jump_Boost = -1200

func _on_body_entered(body):
	if body is Player:
		body.velocity.y = Jump_Boost
		animation_player.play("Action")
