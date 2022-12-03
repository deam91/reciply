import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    Key? key,
    required this.recipe,
    this.iconSize,
    this.textSize,
    this.color,
  }) : super(key: key);

  final Recipe recipe;
  final double? iconSize;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Icon(
            Icons.timer_outlined,
            size: iconSize,
            color: color,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '${recipe.readyInMinutes} min',
            style: TextStyle(
              fontSize: textSize ?? 18,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
