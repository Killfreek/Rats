extends Node

class_name  BaseProjectile

var finalPosition : Vector2
var tileMap : Node2D

@export var speed : float
@export var damage : int

func setup(velocity : Vector2, tileMapP : TileMap):
	finalPosition = self.position + velocity;
	tileMap = tileMapP;

func _on_area_2d_area_entered(area):
	if(area.get_name() == "Player"):
		area.takeDamage(damage);
	
	if(area.get_name() != "Area2D"):
		tileMap.tileHit(finalPosition);
		queue_free();
