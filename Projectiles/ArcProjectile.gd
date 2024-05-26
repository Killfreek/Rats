extends BaseProjectile

@export var minRange : int
@export var maxRange : int
@export var tileWidth : int
@export var curveHeight : int

var startPosition : Vector2
var maxCurveHeight : Vector2
var t = 0.0

func setup(velocity : Vector2):
	var rng = RandomNumberGenerator.new()
	var rngNumber = int(rng.randf_range(minRange, maxRange));
	
	startPosition = self.position;
	
	var xDistance = (rngNumber * tileWidth) * -1;
	finalPosition = startPosition + Vector2(xDistance, 0);
	maxCurveHeight = Vector2(startPosition.x + (xDistance / 2), startPosition.y + curveHeight);

func _process(delta):
	t += (delta * speed)
	if (t >= 1):
		queue_free();
	self.position = _quadratic_bezier(startPosition, maxCurveHeight, finalPosition, t);
	

## p0 - start
## p1 - max height
## p2 - final postition
func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1, t);
	var q1 = p1.lerp(p2, t);
	var r = q0.lerp(q1, t);
	return r
