extends Node

@export var tileMap : TileMap
@export var playerController : Node2D
@export var enemyController : Node2D

func _ready():
	setUpBoard(CustomLevelVars.BoardRowLength, CustomLevelVars.BoardCoumnLength);

func setUpBoard(rows, columns):
	tileMap.clear();
	
	var pattern = tileMap.tile_set.get_pattern(1);
	for row in range(rows):
		for col in range(columns):
			tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * 100, row * 100)), pattern);
