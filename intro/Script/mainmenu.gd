extends Control

@export var PressSFX:AudioStreamPlayer2D
@export var MusicSFX:AudioStreamPlayer2D
func _ready():
	MusicSFX.play()
	
func _on_game_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/Game/Game.tscn")


func _on_daily_activity_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/DailyActivitys/DailyActivity.tscn")


func _on_socialvideo_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/SocialVideo/SocialVideo.tscn")


func _on_goback_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/intro.tscn")
