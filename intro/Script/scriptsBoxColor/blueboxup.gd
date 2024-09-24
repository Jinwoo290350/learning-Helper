extends Node2D

var speed = 100

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2(0, speed * delta)
	translate(motion)
