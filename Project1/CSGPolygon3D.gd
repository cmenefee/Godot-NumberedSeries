extends CSGPolygon3D

@export var speed: float = PI
var d := 0.0
var radius := 150.0

func _process(delta):
	rotate_x(speed*delta)
	rotate_y(speed*delta)
