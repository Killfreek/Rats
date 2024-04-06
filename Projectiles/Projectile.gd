extends BaseProjectile

func _process(delta):
	self.position = self.position.move_toward(finalPosition, delta * speed)
