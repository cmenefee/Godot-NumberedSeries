extends Marker3D
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var rotation_speed = PI
	get_child(0).global_rotation.y = 0
	rotate_y(deg_to_rad(float(rotation_speed)))
	
