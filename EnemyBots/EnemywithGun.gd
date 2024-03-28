extends Node2D

@export var moveStepCount : int
@export var moveStepDistance : int 
@export var speed : int
@export var projectile : PackedScene

var finalPosition
var rowPosition
var returnPosition

signal left(rowIndex : int);

func _ready():
	finalPosition = self.position + Vector2(moveStepCount * (moveStepDistance * -1), 0)
	returnPosition = self.position;
	
func _process(delta):
	if self.position == finalPosition:
		if finalPosition != returnPosition:
			var projectile = projectile.instantiate();
			projectile.position = self.position + Vector2(-100,0);
			projectile.setup(Vector2(-1000,0));
			get_node("/root").add_child(projectile);
			
			finalPosition = returnPosition;
		else:
			queue_free();
	
	move_ToTarget(delta);

func move_ToTarget(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)

func setup(rowPositionP):
	rowPosition = rowPositionP;

func _on_tree_exited():
	left.emit(rowPosition)
