extends Area2D
const SPEED = 1120.0

func _ready():
	$MissileSFX.play()

func _physics_process(delta):
	position.y -= SPEED * delta
	if position.y <= -10:
		queue_free()


