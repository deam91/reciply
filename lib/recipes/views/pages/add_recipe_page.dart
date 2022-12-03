import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/add_recipe_provider.dart';
import 'package:recipe_app/recipes/controllers/recipes_providers.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/steps/directions_form_step.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/steps/ingredients_form_step.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/steps/recipe_form_step.dart';

class AddRecipePage extends ConsumerStatefulWidget {
  const AddRecipePage({super.key});

  @override
  ConsumerState<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends ConsumerState<AddRecipePage> {
  late final PageController _pageController;
  final duration = const Duration(milliseconds: 250);
  Recipe? _recipe;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage({int? index}) {
    // Go to index page
    if (index != null) {
      _pageController.animateToPage(
        index,
        duration: duration,
        curve: Curves.easeInOutCirc,
      );
    }
  }

  void _onSaveRecipe() {
    ref.read(recipeManagementProvider.notifier).save();
  }

  @override
  Widget build(BuildContext context) {
    print('AddRecipePage.builder');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'New Recipe',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        surfaceTintColor: const Color(0xff129575),
        elevation: 0,
      ),
      body: Hero(
        tag: 'add_recipe',
        child: Material(
          color: const Color(0xff129575),
          child: SafeArea(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return RecipeFormStep(
                    onFormCompleted: _goToPage,
                  );
                } else if (index == 1) {
                  return IngredientsFormStep(
                    goToPage: _goToPage,
                  );
                } else {
                  return DirectionsStep(
                    onSaveRecipe: _onSaveRecipe,
                    goBack: _goToPage,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
