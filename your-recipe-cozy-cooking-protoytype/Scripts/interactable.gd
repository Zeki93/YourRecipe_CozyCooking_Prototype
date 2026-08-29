extends Node3D
class_name interactable

var interact_range = 3;
@export var interactable_name: String;
@export var highlight_color: Color;
@export var default_color: Color;
@export var mesh : MeshInstance3D;
@export var text :Label3D;

func _ready() -> void:	
	interactable_initialize()
	pass
	
func _physics_process(delta):
	if(interactable_can_interact()):
		interactable_highlight()
	else:
		interactable_dim()
	pass

func interactable_highlight():
	mesh.material_override.albedo_color = highlight_color
	
func interactable_dim():
	mesh.material_override.albedo_color = default_color

func interactable_can_interact() -> bool:
	if(globals_player.player == null):
		return false
		
	var distance = get_distance_to_player();
	if(distance < interact_range):
		return true
	return false

func interactable_initialize():
	text.text = interactable_name
	mesh.material_override = mesh.material_override.duplicate()
	text.show()

func get_distance_to_player()  -> float:
	var player_pos = globals_player.player.global_position;
	return global_position.distance_to(player_pos);
