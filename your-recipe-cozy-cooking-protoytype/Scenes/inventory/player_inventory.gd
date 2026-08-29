extends Node

@onready var display_text_button :Button = $Button

func _process(delta: float) -> void:
	if(globals_player.player_inventory != null):
		display_text_button.text = globals_player.player_inventory.name
	pass
