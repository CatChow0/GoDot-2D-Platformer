extends StaticBody2D
class_name Fan_platform
@onready var timer = $Delay
@onready var cooldown = $Cooldown
@onready var animation_player = $Area2D/AnimationPlayer
@onready var fan_platform = $"."
var default

# Called when the node enters the scene tree for the first time.
func _ready():
	default = fan_platform
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
	cooldown.start()


func _on_cooldown_timeout():
	fan_platform = default

