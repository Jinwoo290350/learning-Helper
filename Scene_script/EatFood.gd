extends Control

@export var PressSFX:AudioStreamPlayer2D
@export var CorrectSFX:AudioStreamPlayer2D
@export var IncorrectSFX:AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	CorrectSFX.play()
	await get_tree().create_timer(0.2).timeout
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://intro/mainmenu/mainmenu.tscn")


func _on_toilet_pressed():
	IncorrectSFX.play()
	await get_tree().create_timer(0.2).timeout

func _on_bedroom_pressed():
	IncorrectSFX.play()
	await get_tree().create_timer(0.2).timeout



func _on_goback_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/mainmenu/mainmenu.tscn")
