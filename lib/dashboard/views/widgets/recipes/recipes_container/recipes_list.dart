import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipe.dart';

class RecipesList extends StatelessWidget {
  const RecipesList(
      {super.key, required this.pageController, required this.recipes});
  final PageController pageController;
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: recipes.length,
      padEnds: false,
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return RecipeWidget(
              recipe: recipes[index],
              color: Colors.white,
              size: constraints.biggest,
            );
          },
        );
      },
    );
  }
}
