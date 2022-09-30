import 'package:isar/isar.dart';
import 'package:recipe_app/data/api_service.dart';
import 'package:recipe_app/data/models/models.dart';

class RecipesDBService extends APIService {
  late final Isar isar;
  RecipesDBService() : super('') {
    _connect();
  }

  _connect() async {
    isar = await Isar.open([RecipeEntitySchema]);
  }

  @override
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams}) async {
    if (!isar.isOpen) {
      _connect();
    }
    return await isar.recipeEntitys.where().offset(0).limit(10).findAll();
  }

  _saveRecipe(Recipe e) async {
    await isar.writeTxn(
      () => isar.recipeEntitys.put(e),
    );
  }

  Future<void> insertAll(List<Recipe> recipes) async {
    for (var recipe in recipes) {
      await _saveRecipe(recipe);
    }
  }
}
