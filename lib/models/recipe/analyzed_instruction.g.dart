// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyzed_instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnalyzedInstruction _$$_AnalyzedInstructionFromJson(
        Map<String, dynamic> json) =>
    _$_AnalyzedInstruction(
      name: json['name'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnalyzedInstructionToJson(
        _$_AnalyzedInstruction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
    };
