import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/models/models.dart';

class RecipeService {
  RecipeService();

  Future<List<Recipe>> getRecipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    final list = (data['recipes'] as List<dynamic>).map((e) {
      return Recipe.fromJson(e as Map<String, dynamic>);
    });
    return list.toList();
  }
}
