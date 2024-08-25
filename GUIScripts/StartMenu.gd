extends Node

func _on_exit_pressed():
	get_tree().quit();

func _on_options_pressed():
	pass # Replace with function body.

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/LevelMaker.tscn");
