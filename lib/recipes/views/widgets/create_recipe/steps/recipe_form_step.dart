import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/add_recipe_provider.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/add_form.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/steps/ingredients_form_step.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/media_content.dart';

class RecipeFormStep extends ConsumerStatefulWidget {
  const RecipeFormStep({super.key, required this.onFormCompleted});
  final GoToPageCallback onFormCompleted;

  static const index = 0;

  @override
  ConsumerState<RecipeFormStep> createState() => _RecipeFormStepState();
}

class _RecipeFormStepState extends ConsumerState<RecipeFormStep>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleMediaSectionAnimation;
  late final Animation<double> scaleFormSectionAnimation;
  late final Animation<double> opacityFormSectionAnimation;
  String imageUrl = '';

  void _onImageUploaded(String imageUrl) {
    setState(() {
      this.imageUrl = imageUrl;
    });
  }

  void _onFormSaved(Recipe recipe, {int? index}) {
    if (imageUrl == '') {
      return; // TODO: Shake image container showing an error
    }
    recipe.image = imageUrl;
    recipe.likes = 0;
    recipe.ingredients = [];
    recipe.instructions = [];
    recipe.stars = 0;
    ref.read(addRecipeProvider.notifier).createRecipe(recipe);
    widget.onFormCompleted(index: IngredientsFormStep.index);
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

    // HINT: Animation controller is disposed before the animation runs,
    // due to multiple builds caused by the Hero
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          animationController.forward();
        }
      });
    });
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
