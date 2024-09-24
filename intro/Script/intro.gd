extends Control

@export var PressSFX: AudioStreamPlayer2D
@export var MusicSFX: AudioStreamPlayer2D


func  _ready():
	MusicSFX.play()
	
func _on_button_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/mainmenu/mainmenu.tscn")


func _on_quit_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
