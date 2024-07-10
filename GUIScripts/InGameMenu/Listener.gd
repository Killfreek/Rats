extends Node

var menuOpen : bool

func _ready():
	var exitButton = get_node("Exit");
	exitButton.hide();
	exitButton.disabled = true;
	
	menuOpen = false;

func _process(delta):
	if Input.is_action_just_pressed("InGameMenu"):
		if !menuOpen:
			var exitButton = get_node("Exit");
			exitButton.show();
			exitButton.disabled = false;
			
			menuOpen = true;			
		else:			
			var exitButton = get_node("Exit");
			exitButton.hide();
			exitButton.disabled = true;
			
			menuOpen = false;
