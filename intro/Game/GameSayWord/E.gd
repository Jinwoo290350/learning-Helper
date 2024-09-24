extends Node2D

@onready var saywords_node = get_node("res://intro/Game/GameSayWord/SayWords.tscn")
@onready var picture: Sprite2D = $Sprite2D
@export var score: int = 0
var test: int = 0

func update_score(new_score: int):
	score = new_score
	_update_picture()


func _ready():
	if not saywords_node:
		print("Error: SayWords node not found")
	if not picture:
		print("Error: Sprite2D node not found")
	_update_picture()

func _process(delta):
	# Here you should call update_score with a real new score value
	update_score(score)
	_update_picture()
	pass  # Placeholder since no new score logic is defined

func _update_picture():
	if test == 1:
		picture.texture = ResourceLoader.load("res://godot-whisper/banana au (1).png")
	elif test ==2:
		picture.texture = ResourceLoader.load("res://godot-whisper/car autis (1).png")
	elif test ==3:
		picture.texture = ResourceLoader.load("res://godot-whisper/dog (1).png")
	elif test ==4:
		picture.texture = ResourceLoader.load("res://godot-whisper/book (1).png")
	else:
		picture.texture = ResourceLoader.load("res://godot-whisper/appleee (1).png")

	






func _on_button_pressed():
	test += 1
