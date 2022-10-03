import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/common/models/data/api_service.dart';
import 'package:recipe_app/common/endpoints.dart';
import 'package:recipe_app/recipes/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/data/recipe_search_response.dart';

class RecipesAPIService extends APIService {
  RecipesAPIService() : super(RecipeUrls.baseUrl);

  @override
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams}) async {
    final apiKey = dotenv.env['SPOONACULAR_KEY'];
    if (queryParams != null) {
      queryParams['apiKey'] = apiKey!;
    } else {
      queryParams = {'apiKey': apiKey!};
    }
    try {
      var url = Uri.https(RecipeUrls.baseUrl, RecipeUrls.random, queryParams);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        final list = (data['recipes'] as List<dynamic>).map((e) {
          return Recipe.fromJson(e as Map<String, dynamic>);
        });
        return list.toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<List<Recipe>?> searchRecipes({String? text, String? type}) async {
    final apiKey = dotenv.env['SPOONACULAR_KEY'];
    Map<String, dynamic>? queryParams = {
      'apiKey': apiKey!,
      "query": text ?? 'meat',
      "type": type ?? 'main course',
      'instructionsRequired': 'true',
      'addRecipeInformation': 'true',
      'fillIngredients': 'true',
    };

    try {
      var url =
          Uri.https(RecipeUrls.baseUrl, RecipeUrls.complexSearch, queryParams);
      print(url);
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        final resp = RecipeSearchResponse.fromJson(data);
        return resp.results;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
