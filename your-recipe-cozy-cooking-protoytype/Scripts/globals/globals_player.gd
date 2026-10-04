extends Node3D

var player: CharacterBody3D;
var player_inventory : ingredient
var player_state : player_states

signal add_to_inventory(ingredient) 


func _ready() -> void:
	player_state = player_states.active;
	
	#Signals
	add_to_inventory.connect(on_add_to_inventory)
	globals_ui.open_recipe_menu.connect(on_open_menu)
	globals_ui.open_recipe_menu.connect(on_close_menu)
	pass

func on_add_to_inventory(item : ingredient):
	player_inventory = item
	pass

func on_open_menu(recipies: Array[Recipe]):
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
	
	
