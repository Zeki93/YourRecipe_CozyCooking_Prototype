class_name recipe_menu_processing
extends recipe_menu_base

func _ready() -> void:
	globals_ui.open_recipe_menu_processing.connect(open_menu);
	globals_ui.close_recipe_menu_processing.connect(close_menu);
	globals_ui.cook_recipe.connect(cook_recipe)
	pass
	
func open_menu(recipies: Array[Recipe]):
	super(recipies)
	var count:int = recipies.size()
	for recipe in recipies:
		add_option_for_recipe(recipe)
	return
	
func cook_recipe(recipe: Recipe):
	super(recipe)
	globals_ui.close_recipe_menu_processing.emit()

func close_menu():
	super()
