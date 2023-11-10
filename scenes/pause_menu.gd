extends CanvasLayer
@onready var pause_menu = $"."

func _ready():
	pause_menu.hide()

@warning_ignore("unused_parameter")
func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		pauseGame()

func pauseGame():
	if get_tree().paused == false:
		get_tree().paused = true
		pause_menu.show()
	else :
		get_tree().paused = false
		pause_menu.hide()

func _on_button_exit_pressed():
	get_tree().quit()

func _on_button_resume_pressed():
	pauseGame()
