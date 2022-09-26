import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe/analyzed_instruction.dart';
import 'package:recipe_app/ui/widgets/recipe_details/directions/direction.dart';

class DirectionsList extends StatelessWidget {
  const DirectionsList({super.key, required this.analyzedInstructions});
  final List<AnalyzedInstruction> analyzedInstructions;

  _buildList() {
    final List<Widget> steps = [];
    if (analyzedInstructions[0].steps != null) {
      for (var i = 0; i < analyzedInstructions[0].steps!.length; i++) {
        steps.add(Instruction(
          number: i + 1,
          instruction: analyzedInstructions[0].steps![i],
        ));
      }
    }
    return steps;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _buildList(),
          ),
        ),
      ],
    );
  }
}
