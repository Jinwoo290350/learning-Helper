extends Area2D
class_name red_box
var force :Vector2 = Vector2(1, 0)
var speed :int = 100

func _process(delta):
	position += force * delta * speed
	
func _on_area_entered(area :Node):
	if area.name == "dead_zone":
		queue_free()
	if area.name == "End":
		global_score.end = true

func _on_body_entered(body):
	if body.name == "bullet_red":
		body._brok_bullet_red()
		global_score.score += 10
		queue_free()
	else:
		global_score.end = true


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
