extends Node

@export var tileMap : TileMap

func createBoard(rows, columns):
	tileMap.clear();
	
	var pattern = tileMap.tile_set.get_pattern(1);
	for row in range(rows):
		for col in range(columns):
			tileMap.set_pattern(0, Vector2(row, col), pattern);
