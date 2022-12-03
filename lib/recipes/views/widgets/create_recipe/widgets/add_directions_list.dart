import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/recipes/controllers/add_recipe_provider.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/ingredient_item.dart';
import 'package:recipe_app/recipes/views/widgets/create_recipe/widgets/instruction_item.dart';
import 'package:uuid/uuid.dart';

class AddDirectionsList extends ConsumerStatefulWidget {
  const AddDirectionsList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddDirectionsList> createState() => _AddDirectionsListState();
}

class _AddDirectionsListState extends ConsumerState<AddDirectionsList> {
  final List<Instruction> instructions = [];
  final uuid = const Uuid();

  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void addDirection() {
    final instruction = Instruction();
    instruction.step = '';
    instructions.add(instruction);
    _key.currentState?.insertItem(
      instructions.length - 1,
      duration: const Duration(milliseconds: 180),
    );
  }

  _isSavedIngredient(Instruction instructionItem) {
    return instructionItem.number != null &&
        instructionItem.number! > 0.0 &&
        instructionItem.step != null &&
        instructionItem.step!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextButton.icon(
            onPressed: addDirection,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add Direction'),
          ),
          Expanded(
            child: AnimatedList(
              controller: controller,
              key: _key,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 14,
              ),
              itemBuilder: (context, index, animation) {
                final ingredientItem = instructions[index];
                final saved = _isSavedIngredient(ingredientItem);
                animation.addStatusListener(
                  (status) {
                    if (status == AnimationStatus.completed) {
                      controller.animateTo(
                        controller.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InstructionItem(
                    instruction: ingredientItem,
                    saved: saved,
                    animation: animation,
                    onInstructionSaved: (Instruction instruction) {
                      setState(() {
                        instructions[index] = instruction;
                      });
                      print(instructions);
                      ref
                          .read(addRecipeProvider.notifier)
                          .addInstructions(instructions);
                    },
                  ),
                );
              },
              initialItemCount: instructions.length,
            ),
          )
        ],
      ),
    );
  }
}
