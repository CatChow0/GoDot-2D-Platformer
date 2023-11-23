extends StaticBody2D
class_name Fan_platform
@onready var timer = $Delay
@onready var cooldown = $Cooldown
@onready var animation_player = $Area2D/AnimationPlayer
@onready var fan_platform = $"."
@onready var fan_cooldown = fan_platform.get_meta("Cooldown")
var default_position = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	default_position = global_position
	cooldown.wait_time = fan_cooldown
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(timer.wait_time)
	pass

func _on_area_2d_body_entered(body):
	if body is Player:
		timer.start()


func _on_delay_timeout():
	animation_player.play("Turn_Off")


func _on_cooldown_timeout():
	global_position = default_position
	animation_player.play("Turn_On")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Turn_Off" :
		cooldown.start()
