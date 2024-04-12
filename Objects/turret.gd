extends Area2D

var bullet = preload("res://Objects/Bullet.tscn")
var bulletL = preload("res://Objects/BulletL.tscn")
var bulletR = preload("res://Objects/BulletR.tscn")
var bulletD = preload("res://Objects/BulletD.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	await deleteSelf()

func _process(_delta):
	var fire = randi_range(0,20)
	if fire == 9:
		inst($Gun1,$Gun2,$Gun3,$Gun4)



func deleteSelf():
	await get_tree().create_timer(5).timeout
	queue_free()


func inst(turret1,turret2,turret3,turret4):
	var bullet1 = bullet.instantiate()
	bullet1.position = turret1.position
	var bullet2 = bulletL.instantiate()
	bullet2.position = turret2.position
	var bullet3 = bulletR.instantiate()
	bullet3.position = turret3.position
	var bullet4 = bulletD.instantiate()
	bullet4.position = turret4.position
	#get_tree().current_scene.add_child(bullet1)
	add_child(bullet1)
	add_child(bullet2)
	add_child(bullet3)
	add_child(bullet4)
