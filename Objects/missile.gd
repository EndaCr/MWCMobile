extends Area2D
const SPEED = 1120.0


func _physics_process(delta):
	position.y -= SPEED * delta



