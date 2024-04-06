extends Node2D

@export var moveStepCount : int
@export var moveStepDistance : int 
@export var speed : int
@export var projectile : PackedScene

var finalPosition
var rowPosition
var returnPosition
var playerNode : Area2D

signal left(rowIndex : int);

func _ready():
	finalPosition = self.position + Vector2(moveStepCount * (moveStepDistance * -1), 0)
	returnPosition = self.position;
	
func _process(delta):
	if self.position == finalPosition:
		if finalPosition != returnPosition:
			var projectileInstnace = projectile.instantiate();
			projectileInstnace.position = self.position + Vector2(-100,0);
			projectileInstnace.setup(Vector2(-1000,0));

			var callable = Callable(playerNode, "_on_area_2d_area_entered");
			projectileInstnace.get_node("Area2D").connect("area_entered", callable);

			get_node("/root").add_child(projectileInstnace);
			
			finalPosition = returnPosition;
		else:
			queue_free();
	
	move_ToTarget(delta);

func move_ToTarget(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)

func setup(rowPositionP, playerNodeP):
	rowPosition = rowPositionP;
	playerNode = playerNodeP

func _on_tree_exited():
	left.emit(rowPosition)
