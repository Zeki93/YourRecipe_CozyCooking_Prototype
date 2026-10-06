extends Node3D

@onready var characterBody = $CharacterBody3D;

func _ready() -> void:
	globals_player.player = characterBody

func _physics_process(delta):
	if(globals_player.can_player_move_or_interact()):
		calculate_player_movement()

	
func calculate_player_movement():
	var target_velocity = Vector3.ZERO
	var direction = Vector3.ZERO
	var speed = 2.5;

	if Input.is_action_pressed("Right"):
		direction.x += 1
	if Input.is_action_pressed("Left"):
		direction.x -= 1
	if Input.is_action_pressed("Down"):
		direction.z += 1
	if Input.is_action_pressed("Up"):
		direction.z -= 1
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	characterBody.velocity = target_velocity
	characterBody.move_and_slide()
