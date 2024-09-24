extends Area2D

var force :Vector2 = Vector2(1, 0)
var speed :int = 100

func _process(delta):
	position += force * delta * speed
	

func shoot(direction: Vector2):
	force = direction.normalized() * speed

func _on_area_entered(area):
	if area.name == "red_box":
		global_score.score += 10
		queue_free()
