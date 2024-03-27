extends Node3D

var box_file = preload("res://box.tscn")

func createbox() -> RigidBody3D:
	var new_box:RigidBody3D = box_file.instantiate()
	new_box.global_position = Vector3(0,6,0)
	add_child(new_box)
	return(new_box)

func _input(event):
	if Input.is_action_pressed("escape"):
		get_tree().quit()
	if Input.is_action_pressed("create_box"):
		createbox()	

	#match Input.is_action_pressed:
		#"escape":
			#get_tree().quit()
		#"create_box":
			#createbox()

	pass

func _ready():
	pass
