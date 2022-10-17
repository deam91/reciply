import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/directions/direction.dart';

class DirectionsList extends StatelessWidget {
  const DirectionsList({super.key, required this.instructions});
  final List<Instruction> instructions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: instructions.length,
      itemBuilder: (_, i) {
        return InstructionWidget(
          number: instructions[i].number ?? i + 1,
          instruction: instructions[i],
        );
      },
    );
  }
}
