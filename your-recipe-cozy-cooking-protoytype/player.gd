extends Node3D

@onready var characterBody = $CharacterBody3D;

func _ready() -> void:
	globals_player.player = characterBody

func _physics_process(delta):
	var target_velocity = Vector3.ZERO
	var direction = Vector3.ZERO
	var speed = 2.5;
	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("Right"):
		direction.x += 1
	if Input.is_action_pressed("Left"):
		direction.x -= 1
	if Input.is_action_pressed("Down"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("Up"):
		direction.z -= 1

	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	characterBody.velocity = target_velocity
	characterBody.move_and_slide()
