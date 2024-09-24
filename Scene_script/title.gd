extends Control


func _on_b_play_pressed():
	get_tree().change_scene_to_file("res://Scene_script/level_0.tscn")


func _on_b_exit_pressed():
	get_tree().quit()
