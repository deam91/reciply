import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/ingredient/ingredient.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key, required this.ingredients});
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (_, index) {
        return IngredientWidget(
          ingredient: ingredients[index],
        );
      },
    );
  }
}
