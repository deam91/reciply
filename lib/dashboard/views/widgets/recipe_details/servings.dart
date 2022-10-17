import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class RecipeServings extends StatelessWidget {
  const RecipeServings({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          const Icon(
            Icons.person,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '${recipe.servings} servings',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
