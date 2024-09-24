extends Node2D

@onready var red_box_0 = preload("res://Scene_script/bullet_red.tscn")
@onready var green_box_0 = preload("res://Scene_script/bullet_green.tscn")
@onready var blue_box_0 = preload("res://Scene_script/bullet_blue.tscn")

@onready var mark_0 :Marker2D = $marks/mark_0
@onready var mark_1 :Marker2D = $marks/mark_1
@onready var mark_2 :Marker2D = $marks/mark_2
@onready var end :Control = $Control/End

var gamename = "Matchbox"
var num = -1

func _ready():
	global_score.score = 0
	global_score.end = false

func _physics_process(delta) -> void:
	$Control/score_text.text = str(global_score.score)
	end.visible = true if global_score.end else false
	Engine.time_scale = 0 if global_score.end else 1

	
func _on_b_0_0_pressed():
	num = 0
	
func _on_b_0_1_pressed():
	num = 1

func _on_b_0_2_pressed():
	num = 2

func _on_arrow_0_0_pressed():
	var _red :CharacterBody2D = red_box_0.instantiate()
	var _green :CharacterBody2D = green_box_0.instantiate() 
	var _blue :CharacterBody2D = blue_box_0.instantiate()
	var choose :Array = [_red, _green, _blue]
	choose[num].position = $marks/mark_0.position
	choose[num].force = Vector2(0, -1)
	get_parent().add_child(choose[num])

func _on_arrow_0_1_pressed():
	var _red :CharacterBody2D = red_box_0.instantiate()
	var _green :CharacterBody2D = green_box_0.instantiate() 
	var _blue :CharacterBody2D = blue_box_0.instantiate()
	var choose :Array = [_red, _green, _blue]
	choose[num].position = $marks/mark_1.position
	choose[num].force = Vector2(0, -1)
	get_parent().add_child(choose[num])

func _on_arrow_0_2_pressed():
	var _red :CharacterBody2D = red_box_0.instantiate()
	var _green :CharacterBody2D = green_box_0.instantiate() 
	var _blue :CharacterBody2D = blue_box_0.instantiate()
	var choose :Array = [_red, _green, _blue]
	choose[num].position = $marks/mark_2.position
	choose[num].force = Vector2(0, -1)
	get_parent().add_child(choose[num])


func _on_b_restart_pressed():
	get_tree().change_scene_to_file("res://total.tscn")
	

