extends CharacterBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var sensitivity = 0.003
var aniplayerisplaying = false

@onready var camera = $Camera3D
@onready var aniplayer = $AnimationPlayer
@onready var stepsound = $stepsounds

func _process(delta):
	#key binds
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(sensitivity * -event.relative.x)
		camera.rotate_x(sensitivity * -event.relative.y)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-70),  deg_to_rad(70))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		aniplayer.stop()
		aniplayerisplaying = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if aniplayerisplaying == false:			
			aniplayer.play("headbob")
			aniplayerisplaying = true
			stepsound.pitch_scale = randf_range(0.8,1.2)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_animation_player_animation_finished(anim_name):
	#pass # Replace with function body.
	if anim_name == "headbob":
		aniplayerisplaying = false
	
