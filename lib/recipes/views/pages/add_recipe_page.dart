import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/recipes_providers.dart';
import 'package:recipe_app/recipes/views/widgets/add_form.dart';
import 'package:recipe_app/recipes/views/widgets/media_content.dart';

class AddRecipePage extends ConsumerStatefulWidget {
  const AddRecipePage({super.key});

  @override
  ConsumerState<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends ConsumerState<AddRecipePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleMediaSectionAnimation;
  late final Animation<double> scaleFormSectionAnimation;
  late final Animation<double> opacityFormSectionAnimation;
  bool ignorePointer = false;

  String imageUrl = '';

  _onImageUploaded(String imageUrl) {
    setState(() {
      this.imageUrl = imageUrl;
    });
  }

  _onFormSaved(Recipe recipe) {
    if (imageUrl == '') {
      return; // TODO: Shake image container showing an error
    }
    recipe.image = imageUrl;
    recipe.likes = 0;
    recipe.ingredients = [];
    recipe.instructions = [];
    recipe.stars = 0;
    // Call provider to save recipe.
    ref.read(recipeManagementProvider.notifier).save(recipe);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    scaleMediaSectionAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );
    opacityFormSectionAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    scaleFormSectionAnimation = Tween(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        animationController.forward();
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Recipe',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xff129575),
        surfaceTintColor: const Color(0xff129575),
        elevation: 0,
      ),
      body: Hero(
        tag: 'add_recipe',
        child: Material(
          color: const Color(0xff129575),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          FadeTransition(
                            opacity: scaleMediaSectionAnimation,
                            child: ScaleTransition(
                              alignment: Alignment.center,
                              scale: scaleMediaSectionAnimation,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: MediaContent(
                                  onImageUploaded: _onImageUploaded,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeTransition(
                            opacity: opacityFormSectionAnimation,
                            child: ScaleTransition(
                              scale: scaleFormSectionAnimation,
                              child: AddRecipeForm(onFormSaved: _onFormSaved),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
