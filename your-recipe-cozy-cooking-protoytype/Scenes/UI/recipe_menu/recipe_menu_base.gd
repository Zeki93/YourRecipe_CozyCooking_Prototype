class_name recipe_menu_base
extends Control

var recipies : Array[Recipe];
@onready var container = $Menu/VBoxContainer
@onready  var recipe_option = preload("res://Scenes/UI/recipe_menu/recipe_option_button/recipe_option.tscn")

func add_option_for_recipe(recipe: Recipe):
	if(recipe == null): return
	var copy:recipe_option = recipe_option.instantiate();
	container.add_child(copy);
	copy.show_recipe_option(recipe)

func open_menu(recipies: Array[Recipe]):
	show()

func close_menu():
	hide()
	for child in container.get_children():
		container.remove_child(child);
	return
