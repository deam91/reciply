import 'package:flutter/material.dart';
import 'package:recipe_app/models/models.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({super.key, required this.ingredient});
  final ExtendedIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 6,
            width: 6,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[200],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              '${ingredient.amount} ${ingredient.unit} ${ingredient.originalName}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
