import 'package:recipe_app/dashboard/models/data/recipe.dart';

class HeroTag {
  static section(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_section${recipe.recipeId}'
      : 'section${recipe.recipeId}';
  static image(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_image${recipe.image}${recipe.recipeId}'
      : 'image${recipe.image}${recipe.recipeId}';
  static title(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_title${recipe.title}${recipe.recipeId}'
      : 'title${recipe.title}${recipe.recipeId}';
  static divider(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_divider${recipe.recipeId}'
      : 'divider${recipe.recipeId}';
  static minutes(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_minutes${recipe.preparationMinutes}${recipe.recipeId}'
      : 'minutes${recipe.preparationMinutes}${recipe.recipeId}';
  static servings(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_servings${recipe.servings}${recipe.recipeId}'
      : 'servings${recipe.servings}${recipe.recipeId}';
  static reviews(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_reviews${recipe.likes}${recipe.recipeId}'
      : 'reviews${recipe.likes}${recipe.recipeId}';
  static mainSearchField({bool fromSearch = false}) =>
      fromSearch ? 'search_mainSearchField' : 'mainSearchField';
}
