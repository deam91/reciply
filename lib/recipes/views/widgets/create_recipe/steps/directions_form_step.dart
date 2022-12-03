import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/models/utils.dart';
import 'package:recipe_app/recipes/controllers/recipes_providers.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/add_directions_list.dart';

class DirectionsStep extends ConsumerStatefulWidget {
  const DirectionsStep({
    super.key,
    required this.onSaveRecipe,
    required this.goBack,
  });
  final VoidCallback onSaveRecipe;
  final GoToPageCallback goBack;

  static const index = 2;

  @override
  ConsumerState<DirectionsStep> createState() => _DirectionsStepState();
}

class _DirectionsStepState extends ConsumerState<DirectionsStep> {
  ElevatedButton _saveButton() => ElevatedButton.icon(
        onPressed: saveRecipe,
        icon: const Icon(Icons.save_alt_rounded),
        label: const Text('Save'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff129575),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: const StadiumBorder(),
        ),
      );

  ElevatedButton _loadingButton() => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff129575),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: const StadiumBorder(),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );

  void saveRecipe() {
    debugPrint('saveRecipe()');
    widget.onSaveRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddDirectionsList(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                widget.goBack(index: DirectionsStep.index - 1);
              },
              icon: const Icon(Icons.navigate_before_rounded),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                shape: const StadiumBorder(),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final status = ref.watch(recipeManagementProvider);
                return status.when(
                  data: (data) {
                    if (data == RecipeStatus.initial) {
                      return _saveButton();
                    }
                    if (data == RecipeStatus.done) {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        if (mounted) {
                          context.router.pop('saved');
                        }
                      });
                    }
                    return const SizedBox.shrink();
                  },
                  error: (error, stack) {
                    debugPrint(error.toString());
                    showSnackBarMessage(context, error.toString());
                    return _saveButton();
                  },
                  loading: () {
                    debugPrint('Saving recipe...');
                    return _loadingButton();
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
