extends interactable 

@export var recipies : Array[Recipe];

func _ready() -> void:	
	super()
	pass
	
func _physics_process(delta):
	super(delta)
	if(interactable_can_interact() and Input.is_action_pressed("Interact")):
		for recipe in recipies:
			if (globals_player.player_inventory == recipe.input):
				globals_player.add_to_inventory.emit(recipe.output)
				pass
			pass
		pass
