extends Area2D

@export var speed =1
@export var xStepDistance =1
@export var yStepDistance =1 

@export var PlayerAreaTopLeftCorner : Node2D
@export var PlayerAreaBottomRightCorner : Node2D

var player
var playerArea : Rect2
var isMoving = false
var tween
var finalPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(".")
	playerArea = Rect2(
		PlayerAreaTopLeftCorner.position.x,
		PlayerAreaTopLeftCorner.position.y,
		PlayerAreaBottomRightCorner.position.x,
		PlayerAreaBottomRightCorner.position.y);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !isMoving:
		var velocaty = Vector2.ZERO
		if Input.is_action_pressed("MoveRight"):
			velocaty.x += xStepDistance
		if Input.is_action_pressed("MoveLeft"):
			velocaty.x -= xStepDistance
		if Input.is_action_pressed("MoveUp"):
			velocaty.y -= yStepDistance
		if Input.is_action_pressed("MoveDown"):
			velocaty.y += yStepDistance
		
		var intendedFinalPosition = position + velocaty;
		if playerArea.intersection(Rect2(
			intendedFinalPosition.x, intendedFinalPosition.y,
			intendedFinalPosition.x, intendedFinalPosition.y)) != Rect2(0,0,0,0):
				finalPosition = position + velocaty;
				isMoving = true;
	
	move_ToTarget(delta);
		
func move_ToTarget(delta):
	if isMoving:
		player.global_position = player.global_position.move_toward(finalPosition, delta * speed)
	if player.global_position == finalPosition:
		isMoving = false;
