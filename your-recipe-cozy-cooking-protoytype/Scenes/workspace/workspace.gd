extends interactable 

@export var recipies : Array[Recipe];

func _ready() -> void:	
	super()
	pass
	
func _physics_process(delta):
	super(delta)
	if(interactable_can_interact() and Input.is_action_pressed("Interact")):
		globals_ui.open_recipe_menu_processing.emit(calculate_possible_recipies());
	else: 
		if Input.is_action_pressed("Cancel"):
			globals_ui.close_recipe_menu_processing.emit()

func calculate_possible_recipies() -> Array[Recipe]:
	var possible_recipies: Array[Recipe]
	
	var available_ingredients: Array[ingredient]
	available_ingredients.push_front(globals_player.player_inventory)
	for recipe in recipies:
		if(recipe_helper.can_craft_recipe(available_ingredients, recipe)):
			possible_recipies.push_front(recipe)
		#if(recipe.input.size() == 1 and globals_player.player_inventory == recipe.input[0]):
			#possible_recipies.push_front(recipe)
	return possible_recipies;
