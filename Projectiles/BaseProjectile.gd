extends Node

class_name  BaseProjectile

var finalPosition : Vector2

@export var speed : float
@export var damage : int

func _on_area_2d_area_entered(area):
	print(area.get_name());
	if(area.get_name() == "Player"):
		area.takeDamage(damage);
	
	if(area.get_name() != "Area2D"):
		queue_free();
