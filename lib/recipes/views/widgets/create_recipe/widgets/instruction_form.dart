import 'package:flutter/material.dart';
import 'package:recipe_app/common/models/utils.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/form_field.dart';

class InstructionForm extends StatefulWidget {
  const InstructionForm({
    super.key,
    required this.instruction,
    required this.onInstructionSaved,
    required this.saved,
  });
  final Instruction instruction;
  final InstructionCallback onInstructionSaved;
  final bool saved;

  @override
  State<InstructionForm> createState() => _InstructionFormState();
}

class _InstructionFormState extends State<InstructionForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _stepController = TextEditingController();
  final TextEditingController _orderController = TextEditingController();
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    _stepController.text = widget.instruction.step ?? '';
    _orderController.text = widget.instruction.number?.toString() ?? '';
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
      return '';
    }
    return null;
  }

  @override
  void dispose() {
    _orderController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: RecipeFormField(
              enabled: !widget.saved,
              controller: _orderController,
              validator: numberValidator,
              inputKey: Key('instruction_${widget.instruction.number}_order'),
              label: '',
              placeholder: 'Step..',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 4,
            child: RecipeFormField(
              enabled: !widget.saved,
              keyboardType: TextInputType.number,
              controller: _stepController,
              maxLines: 4,
              validator: textValidator,
              inputKey: Key('instruction_${widget.instruction.step}_step'),
              label: '',
              placeholder: 'Description...',
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
                    final ingredient = Instruction()
                      ..step = _stepController.text
                      ..number = int.parse(_orderController.text);
                    print('saving ${ingredient.number} ${ingredient.step}');
                    widget.onInstructionSaved(ingredient);
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
