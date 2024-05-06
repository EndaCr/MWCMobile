extends Node
var score = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		$"../Stats2".text="Score: " + str(score)
		if score == 10:
			var enemy_spawn2 = get_node("%EnemySpawner2")
			enemy_spawn2.set_visible(true)
		if score == 20:
			var enemy_spawn1_1 = get_node("%EnemySpawner4")
			enemy_spawn1_1.set_visible(true)
		if score == 30:
			var enemy_spawn3 = get_node("%EnemySpawner3")
			enemy_spawn3.set_visible(true)
		pass
#func add_score():
#		score+=1
#		print(score)
