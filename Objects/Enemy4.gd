extends Area2D
var SPEED = 100.0
var ship = preload("res://Objects/Enemy1.gd")

func _physics_process(delta):
	position.y += SPEED * delta
	#move_and_slide()
	var tiltRate = Input.get_accelerometer()
	if(tiltRate.x > 9.8):
		inst(ship)
		SPEED = 0
		position.x+= 9000 * delta
		


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1


func inst(item):
	var m_item = item.instantiate()
	add_child(m_item)
