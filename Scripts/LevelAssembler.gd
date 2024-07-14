extends Node

@export var tileMap : TileMap
@export var SpawnPointIndicator : Node;
@export var tileWidth : int

var boardRowSize : int;
var boardColumnSize : int;

func createBoard(rows, columns):
	tileMap.clear();
	SpawnPointIndicator.visible = false;
	
	var pattern = tileMap.tile_set.get_pattern(1);
	for row in range(rows):
		for col in range(columns):
			tileMap.set_pattern(0, tileMap.local_to_map(Vector2(col * tileWidth, row * tileWidth)), pattern);
	boardRowSize = rows;
	boardColumnSize = columns;

func setSpawnPoint(row, column):
	if row > boardRowSize - 1 || boardRowSize == 0:
		return [false, "row is bigger than board size"]
	
	if column > boardColumnSize - 1 || boardColumnSize == 0:
		return [false, "col is bigger than board size"]

	SpawnPointIndicator.position = tileMap.map_to_local(Vector2(column, row));
	SpawnPointIndicator.visible = true;
	return [true, ""]

func RunLevel():
	CustomLevelVars.BoardRowLength = boardRowSize;
	CustomLevelVars.BoardCoumnLength = boardColumnSize;
	
	get_tree().change_scene_to_file("res://Levels/LevelCreatorTester.tscn");
