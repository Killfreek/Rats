extends Node

@export var player : PackedScene
@export var playerSpawnLocation : Vector2

@export var PlayerAreaTopLeftCorner : Node2D
@export var PlayerAreaBottomRightCorner : Node2D

@export var EnemySpawnController : Node2D

var canSpawn : bool

func _ready():
	SpawnPlayer();

func _process(delta):
	if Input.is_action_pressed("SpawnPlayer") && canSpawn:
		SpawnPlayer();

func playerDied():
	canSpawn = true;

func SpawnPlayer():
	canSpawn = false;
	var player = player.instantiate();
	player.PlayerAreaTopLeftCorner = PlayerAreaTopLeftCorner;
	player.PlayerAreaBottomRightCorner = PlayerAreaBottomRightCorner;
	player.position = playerSpawnLocation;
	player.name = "Player";
	add_child(player);

	var playerNode = get_node("Player");
	playerNode.connect("player_died", playerDied);
	playerNode.connect("tree_exiting",EnemySpawnController._on_player_despawn);
	EnemySpawnController.playerNode = playerNode;
	EnemySpawnController.continueSpawnaing = true;
