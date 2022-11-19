import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/views/widgets/form_field.dart';

class AddRecipeForm extends StatefulWidget {
  const AddRecipeForm({super.key, required this.onFormSaved});
  final Function(Recipe recipe) onFormSaved;

  @override
  State<AddRecipeForm> createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _servingsController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _readyInMinutesController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  saveRecipe() {
    // TODO: Create validations for all fields
    // TODO: Validate form
    // TODO: Create recipe object and call onFormSaved with it
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        RecipeFormField(
          inputKey: const Key('new_recipe_title_form_field'),
          controller: _titleController,
          label: 'Title',
          placeholder: 'Title...',
        ),
        const SizedBox(
          height: 8,
        ),
        RecipeFormField(
          inputKey: const Key('new_recipe_summary_form_field'),
          controller: _summaryController,
          label: 'Summary',
          placeholder: 'Recipe summary...',
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          maxLength: 250,
        ),
        const SizedBox(
          height: 8,
        ),
        RecipeFormField(
          inputKey: const Key('new_recipe_servings_form_field'),
          controller: _servingsController,
          label: 'Servings',
          placeholder: 'Amount of servings...',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        RecipeFormField(
          inputKey: const Key('new_recipe_calories_form_field'),
          controller: _caloriesController,
          label: 'Calories',
          placeholder: 'Amount of calories...',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        RecipeFormField(
          inputKey: const Key('new_recipe_readyIn_form_field'),
          controller: _readyInMinutesController,
          label: 'Cook time (minutes)',
          placeholder: 'Time in minutes...',
          keyboardType: TextInputType.number,
          keyboardAction: TextInputAction.done,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {},
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
