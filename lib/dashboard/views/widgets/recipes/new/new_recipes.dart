import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/common/views/widgets/search_not_found.dart';
import 'package:recipe_app/dashboard/controllers/recipes_providers.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/new_recipes_list.dart';

class NewRecipesContainer extends StatelessWidget {
  const NewRecipesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text('New Recipes'),
        const SizedBox(
          height: 15,
        ),
        Consumer(
          builder: (context, ref, child) {
            final newestRecipes = ref.watch(getNewestRecipesProvider);
            return Expanded(
              child: newestRecipes.when(
                data: (data) {
                  if (data != null) {
                    if (data.isEmpty) {
                      return const SearchNotFoundLottie();
                    }
                    return NewRecipesList(
                      items: data,
                    );
                  }
                  return const SearchNotFoundLottie();
                },
                error: (error, stack) {
                  return const SearchNotFoundLottie();
                },
                loading: () {
                  return const LoadingWidget();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
