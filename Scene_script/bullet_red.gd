extends CharacterBody2D
#class_name bullet_red
var speed :int = 200

var force :Vector2 = Vector2.ZERO
func _physics_process(delta) -> void:
	velocity.y = -speed
	move_and_slide()

func _brok_bullet_red() -> void:
	queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
