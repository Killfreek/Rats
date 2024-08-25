extends Node2D

@export var enemyScene : Array[PackedScene]
@export var tileMap : Node2D
var playerNode : Area2D

var spawnLocationsUseState : Array[bool]
var spawnLocations : Array[Vector2]

var continueSpawnaing: bool = false;

func setUpEnemySpawnPoints(locations : Array[Vector2]):
	spawnLocations = locations;
	spawnLocationsUseState.resize(locations.size());
	spawnLocationsUseState.fill(false);

func _on_enemy_spawn_timer_timeout():
	if (continueSpawnaing):
		var rng = RandomNumberGenerator.new()
		var rngNumber = int(rng.randf_range(0, spawnLocations.size()));
		if !spawnLocationsUseState[rngNumber]:
			var spawnLocation = spawnLocations[rngNumber];
			var enimeyToSpawn = int(rng.randf_range(0, enemyScene.size()));
			var enemy = enemyScene[enimeyToSpawn].instantiate();
			enemy.setup(rngNumber, playerNode, tileMap);
			enemy.position = spawnLocation;

			enemy.left.connect(_on_enemy_despawn);

			add_child(enemy);
			spawnLocationsUseState[rngNumber] = true;

func _on_enemy_despawn(index : int):
	spawnLocationsUseState[index] = false;

func _on_player_despawn():
	continueSpawnaing = false;