extends Node2D

@export var speed : int
var finalPosition : Vector2

func _process(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)

func setup(velocity : Vector2):
	finalPosition = self.position + velocity;
