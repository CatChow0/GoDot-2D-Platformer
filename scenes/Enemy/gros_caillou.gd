extends CharacterBody2D
@onready var gros_caillou = $"."
@onready var sprite_2d = $Area2D/Sprite2D
@onready var animation_player = $Area2D/AnimationPlayer
@onready var reset_pos = $ResetPos
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var worldNode
var player
var randNbr
var spawn_position

var moveTo = "idle"
var oldPos
var dif = 0

var speed = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	worldNode = gros_caillou.get_parent()
	player = worldNode.get_node("player")
	spawn_position = global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dif <= 0.001 && dif != 0 :
		if moveTo == "Up":
			animation_player.play("Top_Hit")
			audio_stream_player_2d.play()
		elif moveTo == "Down":
			animation_player.play("Bottom_Hit")
			audio_stream_player_2d.play()
		moveTo ="wait"
		velocity.x = 0
		velocity.y = 0
		reset_pos.start()
		
	if moveTo == "Up":
		velocity.y -= speed * delta
	elif moveTo == "Down":
		velocity.y += speed * delta
	elif moveTo == "idle" :
		if (player.global_position.x + 66) >= gros_caillou.global_position.x && player.global_position.x <= (gros_caillou.global_position.x + (sprite_2d.texture.get_width())):
			if player.global_position.y >= gros_caillou.global_position.y:
				moveTo = "Down"
			elif player.global_position.y <= gros_caillou.global_position.y:
				moveTo = "Up"
	
	oldPos = global_position
	move_and_slide()
	dif = absf(gros_caillou.global_position.y - oldPos.y)

func _on_blink_delay_timeout():
	randNbr = randi() % 7
	if randNbr != 5:
		animation_player.play("idle")
	else:
		animation_player.play("Blink")


func _on_area_2d_body_entered(body):
	if body is Player:
		audio_stream_player_2d.play()
		moveTo = "idle"
		velocity.y = 0
		velocity.x = 0
		global_position = spawn_position
		body.hurt()


func _on_reset_pos_timeout():
	global_position = spawn_position
	moveTo = "idle"
