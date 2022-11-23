import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/models/user_profile.dart';
import 'package:recipe_app/common/models/data_sources/local_cache_service.dart';
import 'package:recipe_app/common/models/data_sources/notification_service.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/models/data_sources/recipes_api_service.dart';
import 'package:recipe_app/search/controllers/search.dart';

final cacheProvider = StateProvider<LocalCacheService>((ref) {
  return LocalCacheService();
});

final notificationProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final recipeServiceProvider =
    NotifierProvider<RecipeSearchNotifier, List<Recipe>?>(
        RecipeSearchNotifier.new);

class RecipeSearchNotifier extends Notifier<List<Recipe>?> {
  late final RecipeService recipeService;

  Future<List<Recipe>?> search(
      {SearchFilter? filters, String text = ''}) async {
    return recipeService.searchRecipes(filters: filters, text: text);
  }

  Future<List<Recipe>?> getRecipes({TagEnum? tag}) async {
    debugPrint('Getting data for tag: ${tag?.value}');
    return recipeService.getRecipes(tag: tag);
  }

  Future<List<Recipe>?> newRecipes() async {
    final filter = SearchFilter(time: TimeEnum.newest);
    return recipeService.searchRecipes(filters: filter);
  }

  Future<List<Recipe>?> userRecipes({String? userId = ''}) async {
    return recipeService.userRecipes(userId: userId);
  }

  Future<DocumentReference<Map<String, dynamic>>> saveRecipe({
    required Recipe recipe,
    required UserProfile? owner,
    required String? userId,
  }) {
    return recipeService.saveRecipe(
      recipe: recipe,
      owner: owner,
      userId: userId,
    );
  }

  @override
  List<Recipe>? build() {
    recipeService = RecipeService(firestore: FirebaseFirestore.instance);
    return [];
  }
}
