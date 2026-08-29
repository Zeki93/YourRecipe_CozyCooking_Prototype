extends Node3D

var player: CharacterBody3D;
var player_inventory : ingredient

signal add_to_inventory(ingredient) 

func _ready() -> void:
	add_to_inventory.connect(on_add_to_inventory)
	pass

func on_add_to_inventory(item : ingredient):
	player_inventory = item
	pass
