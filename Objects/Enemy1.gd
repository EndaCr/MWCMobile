extends Area2D
const SPEED = 600.0

func _physics_process(delta):
	position.y += SPEED * delta
	#move_and_slide()
	


func _on_body_entered(body):
	queue_free()


func _on_area_entered(area):
	#AnimatedSprite2Dd.animation ="destruction"
	queue_free()
