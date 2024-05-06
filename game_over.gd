extends Control

@onready var game_manager = get_parent().get_node("%GameManager")
var highScore = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var save_file = FileAccess.open("user://save.data", FileAccess.READ)
	if save_file!=null:
		highScore= save_file.get_32()

func get_score():
	$"Panel/Game Over".text = "Game Over"
	$Panel/Score.text = "Score: " + str(game_manager.score)
	if game_manager.score > highScore:
		highScore = game_manager.score
		var save_file = FileAccess.open("user://save.data", FileAccess.WRITE)
		save_file.store_32(highScore)
	$"Panel/High Score".text = "High Score: " + str(highScore)
	pass


func _on_retry_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://.godot/exported/133200997/export-e20540a8a37e906f11cb1dae59cc6ed4-MainMenu.scn")
