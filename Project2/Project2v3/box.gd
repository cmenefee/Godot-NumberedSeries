extends RigidBody3D

var direction = Vector3(1,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("remove_box"):
		get_parent().remove_child(self)

