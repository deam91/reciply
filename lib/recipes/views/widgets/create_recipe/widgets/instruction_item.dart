import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/models/constants.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/instruction_form.dart';

class InstructionItem extends StatelessWidget {
  InstructionItem({
    super.key,
    required this.instruction,
    required this.animation,
    required this.onInstructionSaved,
    this.saved = false,
  })  : slideAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
          ),
        ),
        fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
          ),
        );

  final Instruction instruction;
  final Animation<double> animation;
  final InstructionCallback onInstructionSaved;
  final bool saved;

  final Animation<Offset> slideAnimation;
  final Animation<double> fadeInAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeInAnimation,
              child: InstructionForm(
                instruction: instruction,
                onInstructionSaved: onInstructionSaved,
                saved: saved,
              ),
            ),
          );
        });
  }
}
