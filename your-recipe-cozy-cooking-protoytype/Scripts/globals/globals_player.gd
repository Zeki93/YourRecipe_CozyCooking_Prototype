extends Node3D

var player: CharacterBody3D;
var player_inventory : ingredient
var player_state : player_states

var discovered_recipies: Array[Recipe]

signal add_to_inventory(ingredient) 
signal clear_inventory(ingredient) 


func _ready() -> void:
	player_state = player_states.active;
	
	#Signals
	add_to_inventory.connect(on_add_to_inventory)
	clear_inventory.connect(on_clear_inventory)
	globals_ui.open_recipe_menu_processing.connect(on_open_menu_processor)
	globals_ui.close_recipe_menu_processing.connect(on_close_menu)
	globals_ui.open_recipe_menu_combining.connect(on_open_menu_combiner)
	globals_ui.close_recipe_menu_combining.connect(on_close_menu)
	pass

func on_add_to_inventory(item : ingredient):
	player_inventory = item
	pass
	
func on_clear_inventory():
	player_inventory = null
	pass

func on_open_menu_processor(recipies: Array[Recipe]):
	player_state = player_states.in_menu
	pass

func on_open_menu_combiner(recipies: Array[Recipe], combiner_object : combiner):
	player_state = player_states.in_menu
	pass

func on_close_menu():
	player_state = player_states.active
	pass
	
func can_player_move_or_interact() -> bool:
	return player_state == player_states.active

enum player_states{
	active,
	in_menu
}
	
	
