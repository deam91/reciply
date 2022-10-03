import 'package:isar/isar.dart';
import 'package:recipe_app/recipes/models/data_sources/api_service.dart';
import 'package:recipe_app/recipes/models/data/recipe.dart';

class RecipesDBService extends APIService {
  late final Isar isar;
  RecipesDBService() : super('') {
    _connect();
  }

  _connect() async {
    isar = await Isar.open([RecipeSchema, RecipeBookmarkSchema]);
  }

  @override
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams}) async {
    if (!isar.isOpen) {
      _connect();
    }
    return await isar.recipes.where().offset(0).limit(10).findAll();
  }

  _saveRecipe(Recipe e) async {
    await isar.writeTxn(
      () => isar.recipes.put(e),
    );
  }

  Future<int> _saveRecipeBookmark(Recipe e) async {
    final data = RecipeBookmark.fromJson(e.toJson());
    return await isar.writeTxn(
      () => isar.recipeBookmarks.put(data),
    );
  }

  _removeRecipeBookmark(Recipe e) async {
    return await isar.writeTxn(
      () => isar.recipeBookmarks.delete(e.id ?? 0),
    );
  }

  Future<void> insertAll(List<Recipe> recipes) async {
    for (var recipe in recipes) {
      await _saveRecipe(recipe);
    }
  }

  Future<void> saveBookmark(Recipe recipe) async {
    await _saveRecipeBookmark(recipe);
  }

  Future<bool> removeBookmark(Recipe recipe) async {
    return await _removeRecipeBookmark(recipe);
  }
}
