// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Step _$$_StepFromJson(Map<String, dynamic> json) => _$_Step(
      number: json['number'] as int?,
      step: json['step'] as String?,
      length: json['length'] == null
          ? null
          : Length.fromJson(json['length'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StepToJson(_$_Step instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'length': instance.length,
    };
