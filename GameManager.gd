extends Node

var score = 0
var text1 : String = "Tap the arrow keys to move your ship and tap anywhere to shoot!"
var text2 : String = "Draw one of the following shapes to make various objects appear! Certain enemies can only be defeated by these objects."
var text3 : String = "Tilt your phone to remove enemy armour"
var timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$"../Stats2".text = "Score: " + str(score)
	
	if score > 30:
		display_text(text3)
		var enemy_spawn3 = get_node("%EnemySpawner3")
		enemy_spawn3.set_visible(true)
	elif score > 20:
		display_text(text2)
		var enemy_spawn1_1 = get_node("%EnemySpawner4")
		enemy_spawn1_1.set_visible(true)
	elif score > 10:
		display_text(text1)
		var enemy_spawn2 = get_node("%EnemySpawner2")
		enemy_spawn2.set_visible(true)
		
func display_text(message: String):
	$Label.text = message
