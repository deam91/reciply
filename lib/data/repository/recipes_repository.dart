import 'package:flutter/material.dart';
import 'package:recipe_app/data/database/recipes_db_service.dart';
import 'package:recipe_app/data/mock/recipes_mock_service.dart';
import 'package:recipe_app/data/models/models.dart';
import 'package:recipe_app/data/network/recipes_api_service.dart';

late final RecipesRepository recipesRepository;

class RecipesRepository {
  static final RecipesRepository _instance = RecipesRepository._internal(
    RecipesDBService(),
    RecipesAPIService(),
    RecipeMockService(),
  );
  factory RecipesRepository() {
    return _instance;
  }
  RecipesRepository._internal(
      this.dbService, this.apiService, this.apiMockService);

  late final RecipesDBService dbService;
  late final RecipesAPIService apiService;
  late final RecipeMockService apiMockService;

  Future<List<Recipe>?> getRecipes({bool fromAPI = false}) async {
    if (!fromAPI) {
      debugPrint('getting data from local db..');
      final dbRecipes = await dbService.getRecipes();
      if (dbRecipes != null && dbRecipes.isNotEmpty) {
        debugPrint('returning data from local db..');
        return dbRecipes;
      }
    }

    final recipes = await apiService
        .getRecipes(queryParams: {'tags': 'meat', 'number': '10'});
    if (recipes != null && recipes.isNotEmpty) {
      dbService.insertAll(recipes);
      return recipes;
    }

    debugPrint('getting data from local db..');
    final dbRecipes = await dbService.getRecipes();
    if (dbRecipes != null && dbRecipes.isNotEmpty) {
      debugPrint('returning data from local db..');
      return dbRecipes;
    }

    final mockRecipes = await apiMockService.getRecipes();
    debugPrint('saving recipes to db local..');
    dbService.insertAll(mockRecipes ?? []);
    return mockRecipes;
  }

  Future<List<Recipe>?> searchRecipe({String? text, String? type}) async {
    final recipes = await apiService.searchRecipes(text: text, type: type);
    if (recipes != null && recipes.isNotEmpty) {
      return recipes;
    }

    debugPrint('getting data from local db..');
    final dbRecipes = await dbService.getRecipes();
    if (dbRecipes != null && dbRecipes.isNotEmpty) {
      debugPrint('returning data from local db..');
      return dbRecipes;
    }
  }

  Future<void> bookmark(Recipe recipe) async {
    dbService.saveBookmark(recipe);
  }

  Future<bool?> removeBookmark(Recipe recipe) async {
    return await dbService.removeBookmark(recipe);
  }
}
