import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

final getRecipesProvider =
    FutureProvider.autoDispose.family<List<Recipe>?, TagEnum>((ref, tag) async {
  return ref.read(recipeServiceProvider.notifier).getRecipes(tag: tag);
});

final getNewestRecipesProvider =
    FutureProvider.autoDispose<List<Recipe>?>((ref) async {
  return ref.read(recipeServiceProvider.notifier).newRecipes();
});
