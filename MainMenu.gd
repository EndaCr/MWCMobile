extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_pressed():
	$"Button sound".play()
	get_tree().change_scene_to_file("res://Endless.tscn")


func _on_help_pressed():
	$"Button sound".play()
	get_tree().change_scene_to_file("res://level.tscn")


func _on_exit_pressed():
	$"Button sound".play()
	get_tree().quit()
