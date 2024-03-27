extends Node2D

@export var spawnLocations : Array[Node2D]
@export var enemyScene : PackedScene

func _on_enemy_spawn_timer_timeout():
	print("spawning enemy");
	var rng = RandomNumberGenerator.new()
	var spawnLocation = spawnLocations[rng.randf_range(0, spawnLocations.size() - 1)];
	spawnLocation.position.x -= 100;
	var enemy = enemyScene.instantiate();
	enemy.position = self.position + spawnLocation.position;
	var formatString = "enemy spawned at %s";
	var actualString = formatString % [spawnLocation.position];
	print(actualString);

	add_child(enemy);
