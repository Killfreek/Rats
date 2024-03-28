extends Node2D

@export var moveStepCount : int
@export var moveStepDistance : int 
@export var speed : int

var finalPosition
var rowPosition
var returnPosition

signal left(rowIndex : int);

func _ready():
	finalPosition = self.position + Vector2(moveStepCount * (moveStepDistance * -1), 0)
	returnPosition = self.position;
	
func _process(delta):
	move_ToTarget(delta);
	
	if self.position == finalPosition:
		if finalPosition != returnPosition:
			finalPosition = returnPosition;
		else:
			queue_free();

func move_ToTarget(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)

func setup(rowPositionP):
	rowPosition = rowPositionP;

func _on_tree_exited():
	left.emit(rowPosition)
