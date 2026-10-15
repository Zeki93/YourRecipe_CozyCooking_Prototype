class_name recipe_option
extends Control

@onready var button = $"."
var recipe: Recipe;

func _physics_process(delta):
	pass

func show_recipe_option(_recipe: Recipe):
	recipe = _recipe;
	button.text = get_recipe_option_text();
	show()

func get_recipe_option_text() -> String:
	if(globals_player.discovered_recipies.find(recipe) != -1):
		return recipe.name
	else:
		return recipe.discovery_process

func _on_pressed() -> void:
	globals_ui.cook_recipe.emit(recipe)
	pass # Replace with function body.
