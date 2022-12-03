import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

final addRecipeProvider =
    NotifierProvider<AddRecipeProvider, Recipe?>(AddRecipeProvider.new);

class AddRecipeProvider extends Notifier<Recipe?> {
  @override
  Recipe? build() {
    return null;
  }

  Recipe? get recipe => state;

  void createRecipe(Recipe recipe) {
    state = recipe;
  }

  void addIngredients(List<Ingredient> ingredients) {
    if (state != null) state!.ingredients = ingredients;
  }

  void setIngredient(int index, Ingredient ingredient) {
    if (state != null) {
      state!.ingredients![index] = ingredient;
    }
  }

  void addInstructions(List<Instruction> instructions) {
    print(instructions);
    if (state != null) state!.instructions = instructions;
  }

  void setDirection(int index, Instruction instruction) {
    if (state != null) {
      state!.instructions![index] = instruction;
    }
  }

  void reset() {
    state = null;
  }
}
