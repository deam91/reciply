import 'package:flutter/material.dart';
import 'package:recipe_app/common/views/widgets/recipe_details/ingredient/ingredient.dart';
import 'package:recipe_app/recipes/models/data/recipe.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key, required this.extendedIngredients});
  final List<ExtendedIngredientEntity> extendedIngredients;

  _getFirstHalf() {
    final List<Widget> ingredients = [];
    final middle = (extendedIngredients.length / 2).floor();
    for (var i = 0; i < middle; i++) {
      ingredients.add(Ingredient(
        ingredient: extendedIngredients[i],
      ));
    }
    return ingredients;
  }

  _getSecondHalf() {
    final List<Widget> ingredients = [];
    final middle = (extendedIngredients.length / 2).floor();
    for (var i = middle; i < extendedIngredients.length; i++) {
      ingredients.add(Ingredient(
        ingredient: extendedIngredients[i],
      ));
    }
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _getFirstHalf(),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _getSecondHalf(),
          ),
        )
      ],
    );
  }
}
