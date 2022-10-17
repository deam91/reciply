import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, required this.ingredient});
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[200],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${ingredient.amount} ${ingredient.unit} ${ingredient.name}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
