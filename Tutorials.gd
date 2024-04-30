extends Node2D

var startPoint: Vector2
var midPoint: Vector2
var curPoint: Vector2
var storedStart: Vector2
var storedEnd: Vector2
var storedMid: Vector2

var canDraw = false
var drawing = false
var length = 100
var drawRange = 30

var missile = preload("res://Objects/missile.tscn")
var shield = preload("res://Objects/shield.tscn")
var turret = preload("res://Objects/turret.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
		var tiltRate = Input.get_accelerometer()
		$TiltLabel.text = str(snapped(tiltRate.x,0.01)) +", "+ str(snapped(tiltRate.y,0.01))
		if tiltRate.x > 5 || tiltRate.x <-5 || tiltRate.y > 5|| tiltRate.y <-5:
			$TiltLabel.set("theme_override_colors/font_color",Color(255,255,0))

		else:
			$TiltLabel.set("theme_override_colors/font_color",Color(255,255,255))
	
	
		if Input.is_action_just_pressed("shoot"):
			if !drawing && canDraw:
				drawing = true
				startPoint = get_global_mouse_position()
		#		print("position: " , startPoint)

		if Input.is_action_pressed("shoot"):
			if drawing:
				curPoint = get_global_mouse_position()
				if startPoint.distance_to(curPoint) >= length:
					midPoint = Vector2((startPoint.x+curPoint.x)/2,(startPoint.y+curPoint.y)/2)
					#$TutorialLabel.text = str(abs(storedStart.y - storedEnd.y))
					queue_redraw()
					if abs(storedEnd.y - startPoint.y)<=50 && startPoint.distance_to(curPoint)>= storedStart.distance_to(storedEnd):
						if storedStart.y > storedEnd.y && curPoint.y >startPoint.y:
							var missilePoint = Vector2((startPoint.x+storedEnd.x)/2,(startPoint.y+storedEnd.y)/2)
							print("missile")
							inst(missilePoint,missile)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							startPoint = curPoint
							
							#curPoint = Vector2.ZERO
					if startPoint.distance_to(storedMid)<= 100 && curPoint.y >storedMid.y:
						if abs(storedStart.y - storedEnd.y)<= 80:
							print("shield")
							inst(storedMid, shield)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							startPoint = curPoint
					if midPoint.distance_to(storedMid) <= drawRange:
						if(abs(storedStart.y - storedEnd.y)<= 5 && abs(startPoint.x - curPoint.x)<= 5)||(abs(storedStart.x - storedEnd.x)<= 5 && abs(startPoint.y - curPoint.y)<= 5):
							print("turret")
							inst(midPoint, turret)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							storedMid = Vector2.ZERO
							startPoint = curPoint
		else:
			drawing = false
			storedStart = startPoint
			storedEnd = curPoint
			storedMid = midPoint
			
			

func inst(point, item):
	var m_item = item.instantiate()
	m_item.position = point + Vector2(0,300)
	add_child(m_item)




func _draw():
	draw_line(Vector2(storedStart.x, storedStart.y),Vector2(storedEnd.x,storedEnd.y), Color.CORAL, 5.0)
	draw_line(Vector2(startPoint.x, startPoint.y),Vector2(curPoint.x, curPoint.y),Color.WHITE, 5.0)



func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_basics_pressed():
	$TutorialLabel.text = "Tap the arrow keys to move your ship and tap anywhere to shoot!"
	$Player.set_visible(true)
	$LeftButton.set_visible(true)
	$RightButton.set_visible(true)
	$TiltLabel.set_visible(false)
	$Shapes.set_visible(false)
	$ItemSpawner.set_visible(false)
	canDraw = false


func _on_drawing_pressed():
	$TutorialLabel.text = "Draw one of the following shapes to make various objects appear\ncertain enemies can only be defeated by these objects."
	$Player.set_visible(false)
	$LeftButton.set_visible(false)
	$RightButton.set_visible(false)
	$TiltLabel.set_visible(false)
	$Shapes.set_visible(true)
	$ItemSpawner.set_visible(false)
	canDraw = true
	
func _on_tilting_pressed():
	$TutorialLabel.text = "Tilt your phone to remove enemy armour"
	$Player.set_visible(false)
	$LeftButton.set_visible(false)
	$RightButton.set_visible(false)
	$TiltLabel.set_visible(true)
	$Shapes.set_visible(false)
	$ItemSpawner.set_visible(true)
	canDraw = false
