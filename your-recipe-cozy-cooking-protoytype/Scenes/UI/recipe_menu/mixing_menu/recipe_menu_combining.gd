class_name recipe_menu_combining
extends recipe_menu_base

var active_combiner: combiner
var all_available_recipies: Array[Recipe]
var possible_recipies: Array[Recipe]

var ingredient_1 : ingredient
var ingredient_2 : ingredient
@onready var button_ingredient_1 :Button = $Menu/HBoxContainer/Button_ingredient_1
@onready var button_ingredient_2 :Button = $Menu/HBoxContainer/Button_ingredient_2

func _ready() -> void:
	globals_ui.open_recipe_menu_combining.connect(open_menu_combiner);
	globals_ui.close_recipe_menu_combining.connect(close_menu);
	pass
	

func _physics_process(delta):
	if(visible):
		update_button_ingredient_text(button_ingredient_1, ingredient_1)
		update_button_ingredient_text(button_ingredient_2, ingredient_2)

func update_button_ingredient_text(buttton:Button, ingredient_value :ingredient):
		if(ingredient_value != null):
			buttton.text = "Take: {0}".format([ingredient_value.name])
		else: if(globals_player.player_inventory != null):
			buttton.text = "Place: {0}".format([globals_player.player_inventory.name])
		else:
			buttton.text = "An ingredient can be placed here"
	
func open_menu_combiner(recipies: Array[Recipe], combiner_object: combiner):
	super.open_menu(recipies)
	active_combiner = combiner_object;
	all_available_recipies = recipies;

func close_menu():
	super()
	active_combiner = null;
	all_available_recipies = [];
	possible_recipies = [];


func _on_button_ingredient_1_pressed() -> void:
	if(globals_player.player_inventory != null && ingredient_1 == null):
		ingredient_1 = globals_player.player_inventory
		globals_player.clear_inventory.emit();
	else: if(globals_player.player_inventory == null && ingredient_1 != null):
		globals_player.add_to_inventory.emit(ingredient_1);
		ingredient_1 = null;


func _on_button_ingredient_2_pressed() -> void:
	if(globals_player.player_inventory != null && ingredient_2 == null):
		ingredient_2 = globals_player.player_inventory
		globals_player.clear_inventory.emit();
	else: if(globals_player.player_inventory == null && ingredient_2 != null):
		globals_player.add_to_inventory.emit(ingredient_2);
		ingredient_2 = null;
