import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/models.dart';

class Calories extends StatelessWidget {
  const Calories({
    Key? key,
    required this.animation,
    required this.recipe,
  }) : super(key: key);

  final Animation<double> animation;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('calories...');
    }
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => FadeTransition(
        opacity: CurvedAnimation(
            parent: animation, curve: const Interval(0.25, 1.0)),
        child: child,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.local_fire_department,
            size: 24,
          ),
          const SizedBox(
            width: 3,
          ),
          FittedBox(
            child: Text(
              '${recipe.pricePerServing!.floor()} calories',
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
