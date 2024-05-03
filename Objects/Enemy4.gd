extends Area2D
var SPEED = 100.0
var ship = preload("res://Objects/Enemy1.gd")
@onready var game_manager = get_parent().get_node("%GameManager")


func _physics_process(delta):
	position.y += SPEED * delta
	#move_and_slide()
	var tiltRate = Input.get_accelerometer()
	if(tiltRate.x > 5):
		inst(ship)
		SPEED = 0
		position.x+= 9000 * delta
	
	if tiltRate.x < -5:
		inst(ship)
		SPEED = 0
		position.x+= -9000 * delta
	if position.x < 0 || position.x > 2000:
		if !game_manager:
			queue_free()
		else:
			game_manager.score += 1
			queue_free()


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1


func inst(item):
	var m_item = item.instantiate()
	add_child(m_item)
