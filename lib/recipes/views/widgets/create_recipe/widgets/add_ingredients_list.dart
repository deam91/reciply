import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/add_recipe_provider.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/ingredient_item.dart';
import 'package:uuid/uuid.dart';

class AddIngredientsList extends ConsumerStatefulWidget {
  const AddIngredientsList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddIngredientsList> createState() => _AddIngredientsListState();
}

class _AddIngredientsListState extends ConsumerState<AddIngredientsList> {
  final List<Ingredient> ingredients = [];
  final uuid = const Uuid();

  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void addIngredient() {
    final ingredient = Ingredient();
    ingredient.id = uuid.v4();
    ingredient.unit = '';
    ingredients.add(ingredient);
    _key.currentState?.insertItem(
      ingredients.length - 1,
      duration: const Duration(milliseconds: 180),
    );
  }

  _isSavedIngredient(Ingredient ingredientItem) {
    return ingredientItem.amount != null &&
        ingredientItem.amount! > 0.0 &&
        ingredientItem.name != null &&
        ingredientItem.name!.isNotEmpty &&
        ingredientItem.unit != null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextButton.icon(
            onPressed: addIngredient,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add Ingredient'),
          ),
          Expanded(
            child: AnimatedList(
              controller: controller,
              key: _key,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 14,
              ),
              itemBuilder: (context, index, animation) {
                final ingredientItem = ingredients[index];
                final saved = _isSavedIngredient(ingredientItem);
                animation.addStatusListener(
                  (status) {
                    if (status == AnimationStatus.completed) {
                      controller.animateTo(
                        controller.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: IngredientItem(
                    ingredient: ingredientItem,
                    saved: saved,
                    animation: animation,
                    onIngredientSaved: (Ingredient ingredient) {
                      setState(() {
                        ingredients[index] = ingredient;
                        ref
                            .read(addRecipeProvider.notifier)
                            .addIngredients(ingredients);
                      });
                    },
                  ),
                );
              },
              initialItemCount: ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}
