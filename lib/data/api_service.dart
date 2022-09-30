import 'package:recipe_app/data/models/models.dart';

abstract class APIService {
  APIService(this.baseUrl);
  final String baseUrl;
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams});
  Future<List<Recipe>?> searchRecipes({String? text, List<String>? tags}) {
    return Future.value(<Recipe>[]);
  }
}
