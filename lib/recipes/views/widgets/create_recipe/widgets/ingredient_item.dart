import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/ingredient_form.dart';

class IngredientItem extends StatelessWidget {
  IngredientItem({
    super.key,
    required this.ingredient,
    required this.animation,
    required this.onIngredientSaved,
    this.saved = false,
  })  : slideAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
          ),
        ),
        fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
          ),
        );

  final Ingredient ingredient;
  final Animation<double> animation;
  final IngredientCallback onIngredientSaved;
  final bool saved;

  final Animation<Offset> slideAnimation;
  final Animation<double> fadeInAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeInAnimation,
              child: IngredientForm(
                ingredient: ingredient,
                onIngredientSaved: onIngredientSaved,
                saved: saved,
              ),
            ),
          );
        });
  }
}
