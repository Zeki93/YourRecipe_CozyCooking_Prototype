extends VBoxContainer


func _on_cancel_button_pressed() -> void:
	globals_ui.close_recipe_menu_combining.emit()
	globals_ui.close_recipe_menu_processing.emit()
