extends Node2D

@onready var global = get_node("res://intro/Game/GameBoxColor/Scenes/Globals.gd")

func _ready():
	pass

	
func _on_BackButtonDifficulty_pressed():
	get_node("UI/MenuButtons").move(Vector2(-576, 0))
	get_node("ScoreNode/EndOptions").move(Vector2(576, -40))
	MoveStuff(0, 100, 0, 0, 0, -400, 0, 1024, 576, 0, "Hard", 3, true)
	global.score = 0
	
func MoveStuff(ui_x, ui_y, db_x, db_y, score_x, score_y, buttons_x, buttons_y, em_x, em_y, mode, limit, over):
	get_node("UI").move(Vector2(ui_x, ui_y))
	get_node("UI/DifficultyButtons").move(Vector2(db_x, db_y))
	get_node("ScoreNode").move(Vector2(score_x, score_y))
	get_node("Buttons").move(Vector2(buttons_x, buttons_y))
	get_node("Emitters").begin_game()
	get_node("Emitters").move(Vector2(em_x, em_y))
	get_node("ScoreNode/HighScore").text = "High Score: " + str(global.get_high_score("HighScores", mode))
	
	global.current_mode = mode
	global.projectile_limit = limit
	
	global.game_over = over


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_RestartButton_pressed():
	get_node("Emitters").begin_game()
	get_node("ScoreNode/EndOptions").move(Vector2(576, -40))
	
	global.score = 0
	global.game_over = false

func end_options():
	get_node("ScoreNode/EndOptions").move(Vector2(0, -40))
	get_node("Emitters").move(Vector2(576, 0))
