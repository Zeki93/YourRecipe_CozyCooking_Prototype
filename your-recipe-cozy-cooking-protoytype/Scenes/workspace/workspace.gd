extends interactable 

@export var recipies : Array[Recipe];

func _ready() -> void:	
	super()
	pass
	
func _physics_process(delta):
	super(delta)
	if(interactable_can_interact() and Input.is_action_pressed("Interact")):
		globals_ui.open_recipe_menu.emit(calculate_possible_recipies());

func calculate_possible_recipies() -> Array[Recipe]:
	var possible_recipies: Array[Recipe]
	for recipe in recipies:
		if (globals_player.player_inventory == recipe.input):
			possible_recipies.push_front(recipe)
	return possible_recipies;
