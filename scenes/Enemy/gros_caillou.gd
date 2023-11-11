extends CharacterBody2D
@onready var gros_caillou = $"."
@onready var sprite_2d = $Area2D/Sprite2D
@onready var animation_player = $Area2D/AnimationPlayer

var worldNode
var player
var randNbr
var spawn_position

var speed = 2000

# Called when the node enters the scene tree for the first time.
func _ready():
	worldNode = gros_caillou.get_parent()
	player = worldNode.get_node("player")
	spawn_position = global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (player.global_position.x + 66) >= gros_caillou.global_position.x && player.global_position.x <= (gros_caillou.global_position.x + (sprite_2d.texture.get_width()/2)):
		if player.global_position.y >= gros_caillou.global_position.y:
			velocity.y += speed * delta
			animation_player.play("Bottom_Hit")
		elif player.global_position.y <= gros_caillou.global_position.y:
			velocity.y -= speed * delta
			animation_player.play("Top_Hit")
		
			
	move_and_slide()

func _on_blink_delay_timeout():
	randNbr = randi() % 7
	if randNbr != 5:
		animation_player.play("idle")
	else:
		animation_player.play("Blink")


func _on_area_2d_body_entered(body):
	if body is Player:
		global_position = spawn_position
		body.hurt()
