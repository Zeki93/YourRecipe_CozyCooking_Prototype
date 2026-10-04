extends Control

var recipies_in_menu : Array[Recipe];
@onready var container = $VBoxContainer
@export var recipe_option = preload("res://Scenes/UI/recipe_option.tscn")


func _ready() -> void:
	globals_ui.open_recipe_menu.connect(open_recipe_menu);
	pass
	
func open_recipe_menu(recipies: Array[Recipe]):
	for recipe in recipies:
		add_option_for_recipe(recipe)
	return

func add_option_for_recipe(recipe: Recipe):
	var copy:Button = recipe_option.instantiate();
	copy.show();
	container.add_child(copy);
	copy.text = recipe.output.name
