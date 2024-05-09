extends CharacterBody2D



var startPoint: Vector2
var curPoint: Vector2
var bullet = preload("res://Objects/Bullet.tscn")
#var menu = preload("res://MainMenu.tscn")
var SPEED = 600.0
var finished = false

@export var hp = 3


func _draw():
	draw_line(Vector2(startPoint.x, startPoint.y),Vector2(curPoint.x, curPoint.y),Color.WHITE, 5.0)

func _physics_process(_delta):
	if hp <= 0 && !finished:
		finished = true
		$AnimatedSprite2D.play("explosion")
		$Destruction.play()
		await gameOver()
	# Handle jump.
	if Input.is_action_just_pressed("shoot") && hp> 0:
		inst($Turret1,$Turret2)
		
	var direction = Input.get_axis("left", "right")
	if direction && hp> 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)
	position = position.posmodv(get_viewport_rect().size)
	move_and_slide()

func inst(turret1 , turret2):
	var bullet1 = bullet.instantiate()
	bullet1.position = turret1.position
	var bullet2 = bullet.instantiate()
	bullet2.position = turret2.position
	#get_tree().current_scene.add_child(bullet1)
	add_child(bullet1)
	add_child(bullet2)
	
func gameOver():
	var gameOverRef = get_tree().current_scene.get_node("Game Over")
	await get_tree().create_timer(0.8).timeout
	gameOverRef.get_score()
	$"../Game Over".set_visible(true)
	

