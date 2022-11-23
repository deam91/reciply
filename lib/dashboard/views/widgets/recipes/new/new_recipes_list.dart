import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/new_recipe_item.dart';

class NewRecipesList extends StatelessWidget {
  NewRecipesList({super.key, required this.items});
  final List<Recipe> items;

  final PageController pageController = PageController(viewportFraction: .85);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (_, index) {
        return NewRecipeItem(
          recipe: items[index],
          color: Colors.white,
        );
      },
    );
  }
}
