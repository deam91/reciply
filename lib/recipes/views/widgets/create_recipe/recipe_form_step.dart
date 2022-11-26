import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/add_form.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/media_content.dart';

class RecipeFormStep extends StatefulWidget {
  const RecipeFormStep({super.key, required this.onFormCompleted});
  final RecipeCallback onFormCompleted;

  @override
  State<RecipeFormStep> createState() => _RecipeFormStepState();
}

class _RecipeFormStepState extends State<RecipeFormStep>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleMediaSectionAnimation;
  late final Animation<double> scaleFormSectionAnimation;
  late final Animation<double> opacityFormSectionAnimation;
  String imageUrl = '';
  Recipe? _recipe;

  void _onImageUploaded(String imageUrl) {
    setState(() {
      this.imageUrl = imageUrl;
    });
  }

  void _onFormSaved(Recipe recipe) {
    if (imageUrl == '') {
      return; // TODO: Shake image container showing an error
    }
    recipe.image = imageUrl;
    recipe.likes = 0;
    recipe.ingredients = [];
    recipe.instructions = [];
    recipe.stars = 0;
    setState(() => _recipe = recipe);
  }

  void _nextPage() {}

  void _previousPage() {}

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

    // FIXME: Animation controller is disposed before the animation runs
    print('RecipeFormStep - initState()');
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(milliseconds: 300), () {
    //     print('RecipeFormStep - Future.delayed');
    //     if (mounted && !animationController.isDismissed) {
    //       animationController.forward();
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    print('RecipeFormStep - dispose()');
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('RecipeFormStep - BUILD');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
    );
  }
}
