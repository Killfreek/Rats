extends Node

@export var tileMap : TileMap
@export var SpawnPointIndicator : Node;
@export var EnemySpawnPointIndicator : Node;
@export var tileWidth : int

var boardRowSize : int;
var boardColumnSize : int;
var enemySpawnPoints : Array[Vector2]
var enemySpawnPointsIndicatorsDic = {}

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

func setEnemySpawnPoint(row, column):
	if row > boardRowSize - 1 || boardRowSize == 0:
		return [false, "row is bigger than board size"]
	
	if column > boardColumnSize - 1 || boardColumnSize == 0:
		return [false, "col is bigger than board size"]

	enemySpawnPoints.push_front(tileMap.map_to_local(Vector2(column, row)));
	var indicator = EnemySpawnPointIndicator.duplicate();
	indicator.position = tileMap.map_to_local(Vector2(column, row));
	indicator.visible = true;
	tileMap.add_child(indicator);
	enemySpawnPointsIndicatorsDic[Vector2(column, row)] = indicator;
	return [true, ""]
	
func removeEnemySpawnPoint(row, column):
	if row > boardRowSize - 1 || boardRowSize == 0:
		return [false, "row is bigger than board size"]
	
	if column > boardColumnSize - 1 || boardColumnSize == 0:
		return [false, "col is bigger than board size"]
		
	enemySpawnPoints.erase(tileMap.map_to_local(Vector2(column, row)));
	enemySpawnPointsIndicatorsDic[Vector2(column,row)].queue_free()
	enemySpawnPointsIndicatorsDic.erase(Vector2(column,row));
	return [true, ""]

func RunLevel():
	CustomLevelVars.BoardRowLength = boardRowSize;
	CustomLevelVars.BoardCoumnLength = boardColumnSize;
	CustomLevelVars.SpawnPosition = SpawnPointIndicator.position;
	CustomLevelVars.EnemySpawnPosition = enemySpawnPoints;
	
	get_tree().change_scene_to_file("res://Levels/LevelCreatorTester.tscn");
