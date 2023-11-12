extends CharacterBody2D
@onready var mobile_saw = $"."

var speed = 1000
var spawn_position

func _ready():
	spawn_position = global_position
	
	
func _process(delta):
	print(global_rotation_degrees)
	
	if (global_rotation_degrees < 91 && global_rotation_degrees > 89) || (global_rotation_degrees < 271 && global_rotation_degrees > 270):
		if global_position.y <= spawn_position.y + 200:
			velocity.y += speed * delta
		elif global_position.y >= spawn_position.y - 200:
			velocity.y -= speed * delta
		else:
			velocity.y += speed * delta
	else:
		if global_position.x <= spawn_position.x + 200:
			velocity.x += speed * delta
		elif global_position.x >= spawn_position.x - 200:
			velocity.x -= speed * delta
		else:
			velocity.x += speed * delta
	
	
	move_and_slide()
	


func _on_area_2d_body_entered(body):
	if body is Player:
		body.hurt()
