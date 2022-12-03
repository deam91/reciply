import 'package:recipe_app/dashboard/models/data/recipe.dart';

typedef GoToPageCallback = void Function({int? index});
typedef RecipeCallback = void Function(Recipe recipe, {int? index});
typedef IngredientCallback = void Function(Ingredient ingredient);
typedef InstructionCallback = void Function(Instruction ingredient);
typedef TextCallback = void Function(String? value);
