extends Node2D

var startPoint: Vector2
var midPoint: Vector2
var curPoint: Vector2
var storedStart: Vector2
var storedEnd: Vector2
var storedMid: Vector2

var drawing = false
var length = 100
var drawRange = 30


var missileOn = true
var shieldOn = true
var turretOn = true

var missile = preload("res://Objects/missile.tscn")
var shield = preload("res://Objects/shield.tscn")
var turret = preload("res://Objects/turret.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		$Stats.text="HP: " + str($Player.hp)
		var tiltRate = Input.get_accelerometer()
		$TestLabel.text = str(snapped(tiltRate.x,0.01)) +", "+ str(snapped(tiltRate.y,0.01))
		if tiltRate.x > 5 || tiltRate.x <-5 || tiltRate.y > 5 || tiltRate.y <-5:
			$TestLabel.set("theme_override_colors/font_color",Color(255,255,0))
			print("acceleration") 
		else:
			$TestLabel.set("theme_override_colors/font_color",Color(255,255,255))
	
		if Input.is_action_just_pressed("shoot"):
			if !drawing:
				drawing = true
				startPoint = get_global_mouse_position()
		#		print("position: " , startPoint)

		if Input.is_action_pressed("shoot"):
			if drawing:
				curPoint = get_global_mouse_position()
				if startPoint.distance_to(curPoint) >= length:
					midPoint = Vector2((startPoint.x+curPoint.x)/2,(startPoint.y+curPoint.y)/2)
					queue_redraw()
					if abs(storedEnd.y - startPoint.y)<=50 && startPoint.distance_to(curPoint)>= storedStart.distance_to(storedEnd):
						if storedStart.y > storedEnd.y && curPoint.y >startPoint.y && missileOn:
							var missilePoint = Vector2((startPoint.x+storedEnd.x)/2,(startPoint.y+storedEnd.y)/2)
							print("missile")
							inst(missilePoint,missile)
							missileOn= false
							$MissileIcon.set_visible(false)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							startPoint = curPoint
							await refresh($MissileIcon)
							missileOn = true
							#curPoint = Vector2.ZERO
					if startPoint.distance_to(storedMid)<= 100 && curPoint.y >storedMid.y:
						if abs(storedStart.y - storedEnd.y)<= 80 && shieldOn:
							print("shield")
							inst(storedMid, shield)
							shieldOn = false
							$ShieldIcon.set_visible(false)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							startPoint = curPoint
							await refresh($ShieldIcon)
							shieldOn = true
					if midPoint.distance_to(storedMid) <= drawRange && turretOn:
						if(abs(storedStart.y - storedEnd.y)<= 5 && abs(startPoint.x - curPoint.x)<= 5)||(abs(storedStart.x - storedEnd.x)<= 5 && abs(startPoint.y - curPoint.y)<= 5):
							print("turret")
							inst(midPoint, turret)
							turretOn = false
							$TurretIcon.set_visible(false)
							storedStart = Vector2.ZERO
							storedEnd = Vector2.ZERO
							storedMid = Vector2.ZERO
							startPoint = curPoint
							await refresh($TurretIcon)
							turretOn = true
		else:
			drawing = false
			storedStart = startPoint
			storedEnd = curPoint
			storedMid = midPoint
			
			

func inst(point, item):
	var m_item = item.instantiate()
	m_item.position = point + Vector2(0,300)
	add_child(m_item)


func refresh(icon):
	await get_tree().create_timer(5).timeout
	#cooldown = true
	icon.set_visible(true)
	pass






func _draw():
	draw_line(Vector2(storedStart.x, storedStart.y),Vector2(storedEnd.x,storedEnd.y), Color.CORAL, 5.0)
	draw_line(Vector2(startPoint.x, startPoint.y),Vector2(curPoint.x, curPoint.y),Color.WHITE, 5.0)
