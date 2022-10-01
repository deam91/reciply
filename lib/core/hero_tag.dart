import 'package:recipe_app/data/models/models.dart';

class HeroTag {
  static section(Recipe recipe, {bool fromSearch = false}) =>
      fromSearch ? 'search_section${recipe.id}' : 'section${recipe.id}';
  static image(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_image${recipe.image}${recipe.id}'
      : 'image${recipe.image}${recipe.id}';
  static title(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_title${recipe.title}${recipe.id}'
      : 'title${recipe.title}${recipe.id}';
  static divider(Recipe recipe, {bool fromSearch = false}) =>
      fromSearch ? 'search_divider${recipe.id}' : 'divider${recipe.id}';
  static minutes(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_minutes${recipe.preparationMinutes}${recipe.id}'
      : 'minutes${recipe.preparationMinutes}${recipe.id}';
  static servings(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_servings${recipe.servings}${recipe.id}'
      : 'servings${recipe.servings}${recipe.id}';
  static reviews(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_reviews${recipe.aggregateLikes}${recipe.id}'
      : 'reviews${recipe.aggregateLikes}${recipe.id}';
  static mainSearchField({bool fromSearch = false}) =>
      fromSearch ? 'search_mainSearchField' : 'mainSearchField';
}
