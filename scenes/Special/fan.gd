extends StaticBody2D
@onready var animation_player = $Area2D/AnimationPlayer
@onready var cooldown = $Cooldown
@onready var life_time_delay = $LifeTimeDelay
@onready var collision_shape_2d = $Area2D/CollisionShape2D

var player
var worldNode
var Fan_Speed = 50
var state
# Called when the node enters the scene tree for the first time.
func _ready():
	worldNode = get_parent()
	player = worldNode.get_node("player")
	animation_player.play("Off")
	cooldown.start()
	collision_shape_2d.disabled = true
	state = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if state == true:
		player.velocity.y -= Fan_Speed


func _on_cooldown_timeout():
	animation_player.play("On")
	collision_shape_2d.disabled = false
	life_time_delay.start()


func _on_life_time_delay_timeout():
	animation_player.play("Off")
	collision_shape_2d.disabled = true
	cooldown.start()
	state = false


func _on_area_2d_body_entered(body):
	if body is Player:
		state = true


func _on_area_2d_body_exited(body):
	if body is Player:
		state = false
