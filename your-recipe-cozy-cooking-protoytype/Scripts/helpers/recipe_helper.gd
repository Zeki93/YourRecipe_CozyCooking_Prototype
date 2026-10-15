extends GDScript
class_name recipe_helper

static func can_craft_recipe(ingredients: Array[ingredient], recipe: Recipe) -> bool:
	var ingredients_needed: Array[ingredient]
	for input in recipe.input:
		ingredients_needed.push_front(input)
	
	for _ingredient in ingredients:
		if(ingredients_needed.has(_ingredient)):
			ingredients_needed.erase(_ingredient)
			pass
	
	if(ingredients_needed.size() == 0):
		return true
	else: 
		return false

static func can_craft_recipies(ingredients: Array[ingredient], recipes: Array[Recipe]) -> Array[Recipe]:
	var result: Array[Recipe]
	for possible_recipe in recipes:
		if(can_craft_recipe(ingredients, possible_recipe)):
			result.push_front(possible_recipe);
	return result
