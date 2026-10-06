extends interactable

@export var ressource : ingredient

func _ready() -> void:	
	super()
	pass
	
func _physics_process(delta):
	super(delta)
	if(interactable_can_interact() and Input.is_action_pressed("Interact")):
		globals_player.add_to_inventory.emit(ressource);
		pass
