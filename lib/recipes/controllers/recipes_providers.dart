import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/profile/controllers/user_profile_provider.dart';
import 'package:recipe_app/recipes/controllers/add_recipe_provider.dart';

enum RecipeStatus {
  initial,
  creatingRecipe,
  creatingIngredients,
  creatingDirections,
  done,
  saved,
}

final recipeManagementProvider =
    AutoDisposeAsyncNotifierProvider<RecipeManagement, RecipeStatus>(
        RecipeManagement.new);

class RecipeManagement extends AutoDisposeAsyncNotifier<RecipeStatus> {
  Recipe? _recipe;
  Recipe? get recipe => _recipe;

  @override
  RecipeStatus build() {
    return RecipeStatus.initial;
  }

  void save() async {
    final recipe = ref.read(addRecipeProvider.notifier).recipe;
    print('provider - save()');
    print(recipe);
    if (recipe != null) {
      print(recipe.toString());
      print(recipe.instructions);
      state = const AsyncLoading();
      try {
        final userProfile = ref.read(userProfileProvider.notifier).userProfile;
        final userId = ref.read(authControllerProvider.notifier).fbUser?.uid;
        await ref.read(recipeServiceProvider.notifier).saveRecipe(
              recipe: recipe,
              owner: userProfile,
              userId: userId,
            );
        state = const AsyncValue.data(RecipeStatus.done);
      } on Exception catch (err) {
        debugPrint(err.toString());
        state = AsyncError(err, StackTrace.empty);
      }
    }
  }
}
