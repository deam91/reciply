import 'package:flutter/material.dart';
import 'package:recipe_app/common/models/utils.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/units_dropdown.dart';
import 'package:recipe_app/recipes/views/widgets/form_field.dart';

class IngredientForm extends StatefulWidget {
  const IngredientForm({
    super.key,
    required this.ingredient,
    required this.onIngredientSaved,
    required this.saved,
  });
  final Ingredient ingredient;
  final IngredientCallback onIngredientSaved;
  final bool saved;

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late final AnimationController _controller;
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.ingredient.name ?? '';
    _amountController.text = widget.ingredient.amount?.toString() ?? '';
    dropdownValue = widget.ingredient.unit;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  String? textValidator(String? value) {
    final text = Validator.isNotEmpty(value);
    if (text != null) {
      return text;
    }
    return null;
  }

  String? numberValidator(String? value) {
    final text = Validator.isNumber(value);
    if (text != null) {
      return text;
    }
    return null;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RecipeFormField(
                  enabled: !widget.saved,
                  controller: _nameController,
                  validator: textValidator,
                  inputKey: Key('ingredient_${widget.ingredient.id}_name'),
                  label: '',
                  placeholder: 'Ingredient name...',
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: RecipeFormField(
                        enabled: !widget.saved,
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                        validator: numberValidator,
                        inputKey:
                            Key('ingredient_${widget.ingredient.id}_amount'),
                        label: '',
                        placeholder: 'Amount...',
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: IgnorePointer(
                        ignoring: widget.saved,
                        child: UnitsDropdown(
                          keyName: 'ingredient_${widget.ingredient.id}_units',
                          value: dropdownValue ?? '',
                          onValueChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: !widget.saved
                ? () {
                    print(!widget.saved);
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    formKey.currentState!.save();
                    final ingredient = Ingredient()
                      ..name = _nameController.text
                      ..amount = double.parse(_amountController.text)
                      ..unit = dropdownValue;
                    widget.onIngredientSaved(ingredient);
                  }
                : null,
            icon: const Icon(
              Icons.check_circle_outline_rounded,
            ),
          )
        ],
      ),
    );
  }
}
