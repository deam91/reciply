import 'package:freezed_annotation/freezed_annotation.dart';

import 'length.dart';

part 'step.freezed.dart';
part 'step.g.dart';

@freezed
class RecipeStep with _$Step {
  factory RecipeStep({
    int? number,
    String? step,
    Length? length,
  }) = _Step;

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$StepFromJson(json);
}
