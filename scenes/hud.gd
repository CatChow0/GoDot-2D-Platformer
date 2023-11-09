extends CanvasLayer
@onready var score_label = $HBoxContainer/ScoreLabel
@onready var animation_dead_icon = $HBoxContainer/AnimationDeadIcon


var Dead_Count = 0

func Dead_Count_update():
	Dead_Count = Dead_Count + 1
	score_label.text = str(Dead_Count)
	animation_dead_icon.play("Death_Icon")
