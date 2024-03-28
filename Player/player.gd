extends Area2D

@export var speed =1
@export var xStepDistance =1
@export var yStepDistance =1 

@export var PlayerAreaTopLeftCorner : Node2D
@export var PlayerAreaBottomRightCorner : Node2D

@export var CancelMovementThreshold : int

var player
var playerArea : Rect2
var isMoving = false
var finalPosition
var isDoingReverse = false;

var lastButtonClicked = 0;
var originalDistanceForMovement : float
var movementStartPoint : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(".")
	playerArea = Rect2(
		PlayerAreaTopLeftCorner.position.x,
		PlayerAreaTopLeftCorner.position.y,
		PlayerAreaBottomRightCorner.position.x,
		PlayerAreaBottomRightCorner.position.y);
	$AnimatedSprite2D.animation = "Idle";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocaty = Vector2.ZERO
	if !isMoving:
		if Input.is_action_pressed("MoveRight"): #2
			velocaty.x += xStepDistance
			lastButtonClicked = 2;
		if Input.is_action_pressed("MoveLeft"):
			velocaty.x -= xStepDistance
			lastButtonClicked = 4;
		if Input.is_action_pressed("MoveUp"):
			velocaty.y -= yStepDistance
			lastButtonClicked = 8;
		if Input.is_action_pressed("MoveDown"):
			velocaty.y += yStepDistance
			lastButtonClicked = 16
		
		if velocaty != Vector2.ZERO:		
			var intendedFinalPosition = position + velocaty;
			if playerArea.intersection(Rect2(
				intendedFinalPosition.x, intendedFinalPosition.y,
				intendedFinalPosition.x, intendedFinalPosition.y)) != Rect2(0,0,0,0):
					SetUpMovement(delta, player.position, velocaty);
	else:
		var movementLeftToDo = player.global_position.distance_to(finalPosition);
		var precentageMovementLeft = (movementLeftToDo / originalDistanceForMovement) * 100;

		var canReverse = false
		if Input.is_action_pressed("MoveRight") && lastButtonClicked == 4 && precentageMovementLeft >= CancelMovementThreshold:
			canReverse = true
			lastButtonClicked = 2;
		if Input.is_action_pressed("MoveLeft") && lastButtonClicked == 2 && precentageMovementLeft >= CancelMovementThreshold:
			canReverse = true
			lastButtonClicked = 4;
		if Input.is_action_pressed("MoveUp") && lastButtonClicked == 16 && precentageMovementLeft >= CancelMovementThreshold:
			canReverse = true
			lastButtonClicked = 8;
		if Input.is_action_pressed("MoveDown") && lastButtonClicked == 8 && precentageMovementLeft >= CancelMovementThreshold:
			canReverse = true
			lastButtonClicked = 16

		if !canReverse:
			move_ToTarget(delta);
		elif canReverse && !isDoingReverse:
			isDoingReverse = true;
			isMoving = false;
			velocaty = movementStartPoint - player.position;
			SetUpMovement(delta, player.position, velocaty);

func SetUpMovement(delta, postition, velocaty):
	finalPosition = postition + velocaty;
	isMoving = true;
	originalDistanceForMovement = postition.distance_to(finalPosition);
	movementStartPoint = postition;
	if velocaty.x > 0:
		$AnimatedSprite2D.animation = "Right";
	elif velocaty.x < 0:
		$AnimatedSprite2D.animation = "Left";
	elif velocaty.y > 0:
		$AnimatedSprite2D.animation = "Idle";
	elif velocaty.y < 0:
		$AnimatedSprite2D.animation = "Up";
	move_ToTarget(delta);

func move_ToTarget(delta):
	if isMoving:
		player.global_position = player.global_position.move_toward(finalPosition, delta * speed)
	if player.global_position == finalPosition:
		isMoving = false;
		finalPosition = false;
		isDoingReverse = false;
		$AnimatedSprite2D.animation = "Idle";
