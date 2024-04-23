extends Area2D
const SPEED = 600.0
@onready var game_manager = get_parent().get_node("%GameManager")

func _ready():
	#print_debug(get_tree().get_root())
	pass
func _physics_process(delta):
	position.y += SPEED * delta
	#move_and_slide()


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1


func _on_area_entered(area):
	if area.name!="enemy":
		$Sprite2D.play("destruction")
		game_manager.score+=1
		queue_free()

