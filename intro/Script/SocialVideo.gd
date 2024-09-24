extends Control

@export var PressSFX:AudioStreamPlayer2D



func _on_button_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/mainmenu/Cartoon1.tscn")

func _on_button_2_pressed():
	pass # Replace with function body.


func _on_button_3_pressed():
	pass # Replace with function body.


func _on_button_4_pressed():
	PressSFX.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://intro/mainmenu/mainmenu.tscn")
