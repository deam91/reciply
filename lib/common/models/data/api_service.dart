import 'package:recipe_app/dashboard/controllers/recipes_providers.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

abstract class APIService {
  Future<List<Recipe>?> getRecipes({TagEnum? tag});
  Future<List<Recipe>?> searchRecipes(
      {SearchFilter? filters, String text = ''}) {
    return Future.value(<Recipe>[]);
  }
}
