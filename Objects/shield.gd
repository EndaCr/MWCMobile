extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await deleteSelf()

func deleteSelf():
	await get_tree().create_timer(5).timeout
	queue_free()
