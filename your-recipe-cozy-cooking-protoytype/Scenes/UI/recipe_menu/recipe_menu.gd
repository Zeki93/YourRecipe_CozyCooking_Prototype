extends Control

var recipies : Array[Recipe];
@onready var container = $Menu/VBoxContainer
@export var recipe_option = preload("res://Scenes/UI/recipe_menu/recipe_option_button/recipe_option.tscn")


func _ready() -> void:
	globals_ui.open_recipe_menu.connect(open_recipe_menu);
	globals_ui.close_recipe_menu.connect(close_recipe_menu);
	pass
	
func open_recipe_menu(recipies: Array[Recipe]):
	for recipe in recipies:
		add_option_for_recipe(recipe)
	return

func add_option_for_recipe(recipe: Recipe):
	show()
	var copy:recipe_option = recipe_option.instantiate();
	container.add_child(copy);
	copy.show_recipe_option(recipe)

func close_recipe_menu():
	hide()
	for child in container.get_children():
		container.remove_child(child);
	return
	
