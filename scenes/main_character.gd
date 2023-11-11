extends CharacterBody2D
class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = -700.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var camera = $Camera2D
@onready var hud = $Hud
@onready var player = $"."
@onready var worldNode = player.get_parent()
@onready var pressurePlateNode = worldNode.get_node("Pressure_Plate")

var Dead_Count = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var spawn_position = Vector2(0,0)

func _ready():
	spawn_position = global_position

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jumping"

	# Handle Jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
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
	
#Respawn le player a chaque mort sans recharger la scene
func hurt() :
	global_position = spawn_position
	hud.Dead_Count_update()
	pressurePlateNode.on_player_dead_plate()
	
