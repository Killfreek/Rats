extends Node

@export var tileMap : TileMap

func tileTargetted(tilecords : Vector2):
	var pattern = tileMap.tile_set.get_pattern(6);
	tileMap.set_pattern(0, tileMap.local_to_map(tilecords), pattern);
		
func tileHit(tilecords : Vector2):
	var pattern = tileMap.tile_set.get_pattern(3);
	tileMap.set_pattern(0, tileMap.local_to_map(tilecords), pattern);
