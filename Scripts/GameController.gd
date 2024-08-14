extends Node2D
@onready var scoreLabel: Label = %ScoreLabel
@onready var gameStartLabel: Label = %GameStartLabel
@onready var returnToMenuButton: Button = %ReturnToMenuButton

var canStartGameOnClick: bool = true
var gamePausedTillInput : bool = false
var currentScore: int = 0

func _ready() -> void:
	Engine.time_scale = 0

func _on_top_pipe_body_entered(body):
	if (body.name.match("Flappy")):
		ResetScene()

func _on_bottom_pipe_body_entered(body):
	if (body.name.match("Flappy")):
		ResetScene()

func ResetScene():
	get_tree().reload_current_scene()

func IncrementScore():
	currentScore += 1
	scoreLabel.text = "Score:" + str(currentScore)

func _process(delta: float) -> void:
	if (canStartGameOnClick):
		if(!gamePausedTillInput && Input.is_action_just_pressed("Jump")):
			gamePausedTillInput = true
			gameStartLabel.queue_free()
			returnToMenuButton.queue_free()
			Engine.time_scale = 1
		else:
			pass


func _on_return_to_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/splash_screen.tscn")


func _on_return_to_menu_button_focus_entered() -> void:
	canStartGameOnClick = false


func _on_return_to_menu_button_focus_exited() -> void:
	canStartGameOnClick = true
