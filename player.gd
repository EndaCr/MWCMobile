extends CharacterBody2D

var startPoint: Vector2
var curPoint: Vector2
var bullet = preload("res://Objects/Bullet.tscn")
var SPEED = 400.0

#const JUMP_VELOCITY = -400.0
var drawing = false
var length = 100

func _draw():
	draw_line(Vector2(startPoint.x, startPoint.y),Vector2(curPoint.x, curPoint.y),Color.WHITE, 5.0)

func _physics_process(_delta):


	# Handle jump.
	if Input.is_action_just_pressed("shoot"):
		inst($Turret1,$Turret2)
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()

func inst(turret1 , turret2):
	var bullet1 = bullet.instantiate()
	bullet1.position = turret1.position
	var bullet2 = bullet.instantiate()
	bullet2.position = turret2.position
	#get_tree().current_scene.add_child(bullet1)
	add_child(bullet1)
	add_child(bullet2)
	
