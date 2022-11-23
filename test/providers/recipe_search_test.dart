// create a mock for the class we need to test
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class MockRecipeSearchNotifier extends Mock implements RecipeSearchNotifier {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  //
  ProviderContainer makeProviderContainer(
      MockRecipeSearchNotifier mockRecipeSearchNotifier) {
    final container = ProviderContainer(
      overrides: [
        recipeServiceProvider.overrideWithProvider(
            NotifierProvider<MockRecipeSearchNotifier, List<Recipe>?>(
                MockRecipeSearchNotifier.new)),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('initial data is empty', () {
    final recipeSearchNotifier = MockRecipeSearchNotifier();
    final container = makeProviderContainer(recipeSearchNotifier);
    final listener = Listener();
    container.listen(
      recipeServiceProvider,
      listener,
      fireImmediately: true,
    );
    // verify
    verify(
      () => listener(null, []),
    );
    verifyNoMoreInteractions(listener);
    verifyNever(recipeSearchNotifier.search);
    verifyNever(recipeSearchNotifier.saveRecipe);
    verifyNever(recipeSearchNotifier.getRecipes);
    verifyNever(recipeSearchNotifier.newRecipes);
  });
}
