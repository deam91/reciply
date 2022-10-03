import 'package:flutter/material.dart';
import 'package:recipe_app/common/constants.dart';
import 'package:recipe_app/recipes/models/data/recipe.dart';
import 'package:recipe_app/recipes/views/widgets/recipe.dart';

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
        final color = index % 2 == 0 ? recipeColors[0] : recipeColors[1];
        return LayoutBuilder(
          builder: (_, constraints) {
            return RecipeWidget(
              recipe: recipes[index],
              color: color,
              size: constraints.biggest,
            );
          },
        );
      },
    );
  }
}
