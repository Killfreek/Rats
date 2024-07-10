extends Node

@export var tileMap : TileMap

func tileTargetted(tilecords : Vector2):
	var tilecordsMapped = tileMap.local_to_map(tilecords);
	var isLight = tileMap.get_cell_tile_data(0, tilecordsMapped);
	var isDark = tileMap.get_cell_tile_data(1, tilecordsMapped);
	
	if (isLight != null):
		tileMap.set_pattern(0, tileMap.local_to_map(tilecords), tileMap.tile_set.get_pattern(2));
	else:
		tileMap.set_pattern(1, tileMap.local_to_map(tilecords), tileMap.tile_set.get_pattern(3));
		
func tileHit(tilecords : Vector2):
	var tilecordsMapped = tileMap.local_to_map(tilecords);
	var isLight = tileMap.get_cell_tile_data(0, tilecordsMapped);
	var isDark = tileMap.get_cell_tile_data(1, tilecordsMapped);
	
	if (isLight != null):
		tileMap.set_pattern(0, tilecordsMapped, tileMap.tile_set.get_pattern(0));
	else:
		tileMap.set_pattern(1, tilecordsMapped, tileMap.tile_set.get_pattern(1));
