import 'package:freezed_annotation/freezed_annotation.dart';

import 'step.dart';

part 'analyzed_instruction.freezed.dart';
part 'analyzed_instruction.g.dart';

@freezed
class AnalyzedInstruction with _$AnalyzedInstruction {
  factory AnalyzedInstruction({
    String? name,
    List<RecipeStep>? steps,
  }) = _AnalyzedInstruction;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionFromJson(json);
}
