extends Node

func _ready():
	hideMenu();

func _process(delta):
	if Input.is_action_just_pressed("InGameMenu"):
		showMenu();	

func hideMenu():
	var playButton = get_node("Play");
	playButton.hide();
	playButton.disabled = true;
	
	var exitButton = get_node("Exit");
	exitButton.hide();
	exitButton.disabled = true;
	
	get_tree().paused = false;

func showMenu():
	var playButton = get_node("Play");
	playButton.show();
	playButton.disabled = false;
	
	var exitButton = get_node("Exit");
	exitButton.show();
	exitButton.disabled = false;
	
	get_tree().paused = true;
	
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Levels/StartMenu.tscn");

func _on_play_pressed():
	hideMenu();
