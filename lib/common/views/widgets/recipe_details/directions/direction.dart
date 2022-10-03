import 'package:flutter/material.dart';
import 'package:recipe_app/recipes/models/data/recipe.dart';

class Instruction extends StatelessWidget {
  const Instruction(
      {super.key, required this.instruction, required this.number});
  final RecipeStepEntity instruction;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number',
            style: TextStyle(
              color: Colors.orange[200],
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${instruction.step}',
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
