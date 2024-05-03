extends Area2D
const SPEED = 1100.0

func _ready():
	$BulletSFX.play()

func _physics_process(delta):
	position.y -= SPEED * delta
	if position.y >= -5:
		queue_free()
