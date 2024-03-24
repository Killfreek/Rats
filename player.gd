extends Area2D

@export var speed =1
@export var gridscalex =1
@export var gridscaley =1 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocaty = Vector2.ZERO
	if Input.is_action_pressed("MoveRight"):
		velocaty.x +=1
	if Input.is_action_pressed("MoveLeft"):
		velocaty.x -=1
	if Input.is_action_pressed("MoveUp"):
		velocaty.y -=1
	if Input.is_action_pressed("MoveDown"):
		velocaty.y +=1
	if velocaty.length() > 0:
		velocaty = velocaty.normalized() * speed
	position += velocaty * delta
