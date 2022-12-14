import 'package:flutter/material.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';

class RecipeFormField extends StatelessWidget {
  const RecipeFormField({
    super.key,
    required this.inputKey,
    required this.controller,
    required this.label,
    required this.placeholder,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.keyboardAction = TextInputAction.next,
    this.validator,
    this.enabled = true,
  });
  final Key inputKey;
  final bool enabled;
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final String? Function(String? value)? validator;

  InputDecoration _getInputDecoration(String name) {
    return getInputDecoration(placeholder: name).copyWith(
      counterStyle: const TextStyle(color: Colors.white),
      hoverColor: Colors.white,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.7),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != '')
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (label != '')
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          enabled: enabled,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(.8)),
          controller: controller,
          key: inputKey,
          textInputAction: keyboardAction,
          keyboardType: keyboardType,
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: _getInputDecoration(placeholder),
        ),
      ],
    );
  }
}
