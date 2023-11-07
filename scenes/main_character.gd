extends CharacterBody2D
class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = -700.0
@onready var animated_sprite_2d = $AnimatedSprite2D
const max_life = 3


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#current life
var life = max_life

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "running"
	else :
		animated_sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jumping"

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
	
	
func hurt() -> void:
	if life > 1:
		life -= 1
		animated_sprite_2d.play("hurt")
	else :
		animated_sprite_2d.play("running")
