extends interactable 
class_name combiner

@export var recipies : Array[Recipe];

var ingredient_slot_1: ingredient;
var ingredient_slot_2: ingredient;

func _ready() -> void:	
	super()
	pass
	
func _physics_process(delta):
	super(delta)
	if(interactable_can_interact() and Input.is_action_pressed("Interact")):
		globals_ui.open_recipe_menu_combining.emit(recipies, self);
	else: 
		if Input.is_action_pressed("Cancel"):
			globals_ui.close_recipe_menu_combining.emit()
