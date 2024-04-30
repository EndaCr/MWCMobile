extends Area2D
var Speed = 1000.0

var swiping = false
var length = 100

var startPoint: Vector2
var curPoint: Vector2

@onready var game_manager = get_parent().get_node("%GameManager")

func _ready():
	pass
func _physics_process(delta):
	position.y += Speed * delta
	#move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		if !swiping:
			swiping = true
			startPoint = get_global_mouse_position()
			if startPoint.distance_to(position)>100:
				swiping = false
		pass
		
	if Input.is_action_pressed("shoot"):
		if swiping:
			Speed = 0
			curPoint = get_global_mouse_position()
			if startPoint.distance_to(curPoint) >= length:
				if startPoint.x < curPoint.x:
					while position.x <1800:
						position.x+= 1 + delta
						rotation +=5
					if position.x> 1800:
						game_manager.score += 1
						queue_free()
				if startPoint.x > curPoint.x:
					while position.x > -1:
						position.x-= 1 - delta
						rotation +=5
					if position.x<0:
						game_manager.score += 1
						queue_free()
			

	
	
	
	
	
	
	var tiltRate = Input.get_accelerometer()
	if(tiltRate.x > 5):
		Speed = 0
		position.x+= 9000 * delta
	
	if tiltRate.x < -5:
		Speed = 0
		position.x+= -9000 * delta
	if position.x < 0 || position.x > 2000:
		game_manager.score += 1
		queue_free()
	


func _on_body_entered(body):
	if body.name == "Player":
		body.hp -=1

