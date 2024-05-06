extends Area2D
var SPEED = 200.0

@onready var game_manager = get_parent().get_node("%GameManager")

func _ready():
	pass
func _physics_process(delta):
	#print(str(position.x>= 1000), str(position.x <= 0))
	print(position.x)
	
	if position.y < 450:
		position.y += SPEED * delta
	else:
		if position.x >= 1000:
			position.x -= SPEED * delta
		if position.x >= 0:
			position.x += SPEED * delta
		


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1


func _on_area_entered(area):
	if area.name!="enemy":
		$Sprite2D.play("destruction")
		if !game_manager:
			queue_free()
		else:
			game_manager.score+=1
			queue_free()
