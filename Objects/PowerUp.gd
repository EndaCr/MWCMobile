extends Area2D
const SPEED = 600.0

func _physics_process(delta):
	position.y += SPEED * delta

	


func _on_body_entered(body):
	if body.name == "Player":
		body.hp+=1
		queue_free()
