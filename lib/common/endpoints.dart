import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipeUrls {
  static String baseUrl = 'api.spoonacular.com';
  static get complexSearch => '/recipes/complexSearch';
  static get random => '/recipes/random';
}
