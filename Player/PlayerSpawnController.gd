extends Node

@export var player : PackedScene
@export var playerSpawnLocation : Vector2

@export var PlayerAreaTopLeftCorner : Node2D
@export var PlayerAreaBottomRightCorner : Node2D

var canSpawn : bool

func _ready():
	canSpawn = true;

func _process(delta):
	if Input.is_action_pressed("SpawnPlayer") && canSpawn:
		canSpawn = false;
		var player = player.instantiate();
		player.PlayerAreaTopLeftCorner = PlayerAreaTopLeftCorner;
		player.PlayerAreaBottomRightCorner = PlayerAreaBottomRightCorner;
		player.position = playerSpawnLocation;
		add_child(player);
