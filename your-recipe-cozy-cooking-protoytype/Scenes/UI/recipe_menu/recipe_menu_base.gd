class_name recipe_menu_base
extends Control

var recipies : Array[Recipe];
@onready var container = $Menu/VBoxContainer
@onready var recipe_option = preload("res://Scenes/UI/recipe_menu/recipe_option_button/recipe_option.tscn")

func add_option_for_recipe(recipe: Recipe, recipe_option_scene = recipe_option):
	if(recipe == null): return
	var copy = recipe_option_scene.instantiate();
	container.add_child(copy);
	copy.show_recipe_option(recipe)

func open_menu(recipies: Array[Recipe]):
	show()

func close_menu():
	hide()
	for child in container.get_children():
		container.remove_child(child);
	return

func cook_recipe(recipe: Recipe):
	globals_player.add_to_inventory.emit(recipe.output);
	globals_player.discovered_recipies.push_front(recipe);
