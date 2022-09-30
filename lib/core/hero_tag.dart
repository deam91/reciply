import 'package:recipe_app/data/models/models.dart';

class HeroTag {
  static section(Recipe recipe) => 'section${recipe.id}';
  static image(Recipe recipe) => '${recipe.image}${recipe.id}';
  static title(Recipe recipe) => '${recipe.title}${recipe.id}';
  static divider(Recipe recipe) => 'divider${recipe.id}';
  static minutes(Recipe recipe) => '${recipe.preparationMinutes}${recipe.id}';
  static servings(Recipe recipe) => '${recipe.servings}${recipe.id}';
  static reviews(Recipe recipe) => '${recipe.aggregateLikes}${recipe.id}';
}
