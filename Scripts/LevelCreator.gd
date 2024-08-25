extends Node

@export var tileMap : TileMap
@export var playerController : Node2D
@export var enemyController : Node2D

func _ready():
	setUpBoard(CustomLevelVars.BoardRowLength, CustomLevelVars.BoardCoumnLength);
	setUpPlayer(CustomLevelVars.SpawnPosition);
	setUpEnemySpawnLocations(CustomLevelVars.EnemySpawnPosition);

func setUpBoard(rows, columns):
	tileMap.clear();
	
	# board pattern
	var useLightPattern = true;
	var lightPattern = tileMap.tile_set.get_pattern(0);
	var darkPattern = tileMap.tile_set.get_pattern(1);
	for row in range(rows):
		for col in range(columns):
			if useLightPattern:
				tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * 100, row * 100)), lightPattern);
				useLightPattern = false;
			else:
				tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * 100, row * 100)), darkPattern);
				useLightPattern = true;
		if fmod(columns, 2) == 0:
			if useLightPattern:
				useLightPattern = false;
			else:
				useLightPattern = true;
			
	var borderPattern = tileMap.tile_set.get_pattern(4);
	for col in range(columns):
		tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * 100, -100)), borderPattern);
		tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * 100, (rows) * 100)), borderPattern);

func setUpPlayer(position):
	playerController.playerSpawnLocation = position;
	playerController.SpawnPlayer();

func setUpEnemySpawnLocations(locations):
	enemyController.setUpEnemySpawnPoints(locations);
