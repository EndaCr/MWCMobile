extends Node
var score = 0



	
func _process(_delta):
	$"../Stats2".text=str(score) + "/40\nEnemies"
	if score >=10 && score < 20:
		$"../Label".set_text("Draw")
		$"../Draw prompt".set_visible(true)
		var enemy_spawn2 = get_node("%EnemySpawner2")
		enemy_spawn2.set_visible(true)
		var enemy_spawn1 = get_node("%EnemySpawner")
		enemy_spawn1.set_visible(false)
	if score == 20 && score < 30:
		$"../Label".set_text("")
		$"../Draw prompt".set_visible(false)
		$"../Bomb prompt".set_visible(true)
		var enemy_spawn1_1 = get_node("%EnemySpawner4")
		enemy_spawn1_1.set_visible(true)
		var enemy_spawn2 = get_node("%EnemySpawner2")
		enemy_spawn2.set_visible(false)
	if score == 30 && score < 40:
		$"../Label".set_text("Tilt")
		$"../Bomb prompt".set_visible(false)
		var enemy_spawn3 = get_node("%EnemySpawner3")
		enemy_spawn3.set_visible(true)
		var enemy_spawn1_1 = get_node("%EnemySpawner4")
		enemy_spawn1_1.set_visible(false)
	if score >= 40:
		var enemy_spawn3 = get_node("%EnemySpawner3")
		enemy_spawn3.set_visible(false)
		$"../Game Over".set_visible(true)
	pass
