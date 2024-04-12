extends Area2D
const SPEED = 1100.0


func _physics_process(delta):
	position.x += SPEED * delta
