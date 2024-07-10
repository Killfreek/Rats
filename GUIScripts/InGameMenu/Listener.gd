extends Node

var menuOpen : bool

func _ready():
	var playButton = get_node("Play");
	playButton.hide();
	playButton.disabled = true;
	
	var exitButton = get_node("Exit");
	exitButton.hide();
	exitButton.disabled = true;
	
	menuOpen = false;

func _process(delta):
	if Input.is_action_just_pressed("InGameMenu"):
		if !menuOpen:
			var playButton = get_node("Play");
			playButton.show();
			playButton.disabled = false;
			
			var exitButton = get_node("Exit");
			exitButton.show();
			exitButton.disabled = false;
			
			menuOpen = true;			
		else:
			var playButton = get_node("Play");
			playButton.hide();
			playButton.disabled = true;
			
			var exitButton = get_node("Exit");
			exitButton.hide();
			exitButton.disabled = true;
			
			menuOpen = false;
