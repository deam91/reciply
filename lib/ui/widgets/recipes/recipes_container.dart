import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipes_service.dart';
import 'package:recipe_app/models/recipe/recipe.dart';
import 'package:recipe_app/core/widgets/loading.dart';
import 'package:recipe_app/ui/widgets/recipes/recipes_list.dart';

class RecipesContainer extends StatefulWidget {
  const RecipesContainer({super.key});

  @override
  State<RecipesContainer> createState() => _RecipesContainerState();
}

class _RecipesContainerState extends State<RecipesContainer> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  final RecipeService recipeService = RecipeService();
  late final Future<List<Recipe>> _future;

  @override
  void initState() {
    super.initState();
    _future = recipeService.getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Popular Recipes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: FutureBuilder<List<Recipe>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return RecipesList(
                  pageController: pageController,
                  recipes: snapshot.data!,
                );
              }
              return const LoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
