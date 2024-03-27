extends Node2D

@export var spawnLocations : Array[Node2D]
@export var enemy : Node2D

func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var spawnLocation = spawnLocations[rng.randf_range(0, spawnLocations.size() - 1)];
	spawnLocation.position.x -= 100;
	var enemy = enemy.new();
	enemy.position = spawnLocation.position;
