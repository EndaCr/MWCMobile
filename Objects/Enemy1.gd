extends Area2D
const SPEED = 600.0
@onready var game_manager = get_parent().get_node("%GameManager")

func _ready():
	pass
func _physics_process(delta):
	position.y += SPEED * delta
	#move_and_slide()


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1


func _on_area_entered(area):
	if area.name!="enemy":
		print_debug(area.name)
		$Sprite2D.play("destruction")
		await defeated()

func defeated():
	await get_tree().create_timer(0.5).timeout
	game_manager.score+=1
	queue_free()
	pass
