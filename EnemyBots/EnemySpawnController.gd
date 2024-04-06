extends Node2D

@export var spawnLocations : Array[Node2D]
@export var enemyScene : Array[PackedScene]
@export var playerNode : Area2D

var spawnLocationsUseState : Array[bool]

func _ready():
	spawnLocationsUseState.resize(spawnLocations.size());
	spawnLocationsUseState.fill(false);


func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var rngNumber = int(rng.randf_range(0, spawnLocations.size()));
	if !spawnLocationsUseState[rngNumber]:
		var spawnLocation = spawnLocations[rngNumber];
		var enimeyToSpawn = int(rng.randf_range(0, enemyScene.size()));
		var enemy = enemyScene[enimeyToSpawn].instantiate();
		enemy.setup(rngNumber, playerNode);
		enemy.position = self.position + spawnLocation.position;

		enemy.left.connect(_on_enemy_despawn);

		add_child(enemy);
		spawnLocationsUseState[rngNumber] = true;

func _on_enemy_despawn(index : int):
	spawnLocationsUseState[index] = false;
