extends Node
var score = 0



	
func _process(_delta):
	$"../Stats2".text=str(score) + "/40\nEnemies"
	if score ==10:
		var enemy_spawn2 = get_node("%EnemySpawner2")
		enemy_spawn2.set_visible(true)
		var enemy_spawn1 = get_node("%EnemySpawner")
		enemy_spawn1.set_visible(false)
	if score == 20:
		var enemy_spawn1_1 = get_node("%EnemySpawner4")
		enemy_spawn1_1.set_visible(true)
		var enemy_spawn2 = get_node("%EnemySpawner2")
		enemy_spawn2.set_visible(false)
	if score == 30:
		var enemy_spawn3 = get_node("%EnemySpawner3")
		enemy_spawn3.set_visible(true)
		var enemy_spawn1_1 = get_node("%EnemySpawner4")
		enemy_spawn1_1.set_visible(false)
	if score == 40:
		var enemy_spawn3 = get_node("%EnemySpawner3")
		enemy_spawn3.set_visible(false)
	pass
