extends CharacterBody2D
const SPEED = 600.0

func _physics_process(delta):
	position.y += SPEED * delta
	move_and_slide()
	
