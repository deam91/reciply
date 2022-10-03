import 'package:recipe_app/recipes/models/data/recipe.dart';

abstract class APIService {
  APIService(this.baseUrl);
  final String baseUrl;
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams});
  Future<List<Recipe>?> searchRecipes({String? text, String? type}) {
    return Future.value(<Recipe>[]);
  }
}
