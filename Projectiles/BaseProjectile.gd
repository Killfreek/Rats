extends Node

class_name  BaseProjectile

@export var speed : int
@export var damage : int

var finalPosition : Vector2

func _process(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)

func setup(velocity : Vector2):
	finalPosition = self.position + velocity;

func _on_area_2d_area_entered(area):
	print(area.get_name());
	if(area.get_name() == "Player"):
		area.takeDamage(damage);
	queue_free();
