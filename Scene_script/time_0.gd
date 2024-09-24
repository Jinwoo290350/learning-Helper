extends Timer

@onready var red_box_0 = preload("res://Scene_script/red_box.tscn")
@onready var green_box_0 = preload("res://Scene_script/green_box.tscn")
@onready var blue_box_0 = preload("res://Scene_script/blue_box.tscn")
@onready var mark_3 = $"../marks/mark_3"
@onready var mark_4 = $"../marks/mark_4"
@onready var mark_5 = $"../marks/mark_5"

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
func _on_timeout():
	_spawn_box()

func _spawn_box() -> void:
	var _red :Area2D = red_box_0.instantiate()
	var _green :Area2D = green_box_0.instantiate() 
	var _blue :Area2D = blue_box_0.instantiate()
	var boxs :Array = [_red, _green, _blue, ]
	var sp_position :Array = [mark_3.position, mark_4.position, mark_5.position]
	var box_rn :int = randi_range(0, boxs.size()-1)
	var box_rn_0 :int = randi_range(0, boxs.size()-1)
	boxs[box_rn].force = Vector2(0, 1)
	boxs[box_rn].position = sp_position[box_rn_0]
	get_parent().add_child(boxs[box_rn])
