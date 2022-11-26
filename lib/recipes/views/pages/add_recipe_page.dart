import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/recipes_providers.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/recipe_form_step.dart';

class AddRecipePage extends ConsumerStatefulWidget {
  const AddRecipePage({super.key});

  @override
  ConsumerState<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends ConsumerState<AddRecipePage> {
  late final PageController _pageController;

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

  void _onFormCompleted(Recipe recipe) {
    // Go to ingredients page
  }

  void _onIngredientsCompleted(Recipe recipe) {
    // Go to directions page
  }

  void _onSaveRecipe(Recipe recipe) {
    // Call provider to save recipe.
    ref.read(recipeManagementProvider.notifier).save(recipe);
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
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                print('PageView.builder - $index');
                return RecipeFormStep(
                  onFormCompleted: _onFormCompleted,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
