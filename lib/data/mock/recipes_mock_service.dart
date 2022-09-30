import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/api_service.dart';
import 'package:recipe_app/data/models/models.dart';

class RecipeMockService extends APIService {
  RecipeMockService() : super('');

  @override
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams}) async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    final list = (data['recipes'] as List<dynamic>).map((e) {
      return Recipe.fromJson(e as Map<String, dynamic>);
    });
    return list.toList();
  }

  @override
  Future<List<Recipe>?> searchRecipes({String? text, List<String>? tags}) {
    return Future.value(<Recipe>[]);
  }
}
