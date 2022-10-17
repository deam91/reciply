import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class Calories extends StatefulWidget {
  const Calories({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('calories...');
    }
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: FittedBox(
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
                '${widget.recipe.calories!.floor()} calories',
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
