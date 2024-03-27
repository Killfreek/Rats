extends Node2D

@export var moveStepCount : int
@export var moveStepDistance : int 
@export var speed : int

var finalPosition

func _ready():
	finalPosition = self.position + Vector2(moveStepCount * (moveStepDistance * -1), 0)

func _process(delta):
	move_ToTarget(delta);
	
	if self.position == finalPosition:
		queue_free();

func move_ToTarget(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)
