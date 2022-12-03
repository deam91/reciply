import 'package:flutter/material.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/add_ingredients_list.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/steps/directions_form_step.dart';

class IngredientsFormStep extends StatefulWidget {
  const IngredientsFormStep({
    super.key,
    required this.goToPage,
  });
  static const index = 1;
  final GoToPageCallback goToPage;

  @override
  State<IngredientsFormStep> createState() => _IngredientsFormStepState();
}

class _IngredientsFormStepState extends State<IngredientsFormStep>
    with AutomaticKeepAliveClientMixin {
  void goToPage() {
    debugPrint('saveRecipeAndGoToPage()');
    widget.goToPage(
      index: DirectionsStep.index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AddIngredientsList(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                widget.goToPage(index: IngredientsFormStep.index - 1);
              },
              icon: const Icon(
                Icons.navigate_before_rounded,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xff129575),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                shape: const StadiumBorder(),
              ),
              onPressed: goToPage,
              child: const Text('Next'),
            )
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
