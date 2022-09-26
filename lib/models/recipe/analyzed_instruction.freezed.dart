// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analyzed_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyzedInstruction _$AnalyzedInstructionFromJson(Map<String, dynamic> json) {
  return _AnalyzedInstruction.fromJson(json);
}

/// @nodoc
mixin _$AnalyzedInstruction {
  String? get name => throw _privateConstructorUsedError;
  List<RecipeStep>? get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzedInstructionCopyWith<AnalyzedInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzedInstructionCopyWith<$Res> {
  factory $AnalyzedInstructionCopyWith(
          AnalyzedInstruction value, $Res Function(AnalyzedInstruction) then) =
      _$AnalyzedInstructionCopyWithImpl<$Res>;
  $Res call({String? name, List<RecipeStep>? steps});
}

/// @nodoc
class _$AnalyzedInstructionCopyWithImpl<$Res>
    implements $AnalyzedInstructionCopyWith<$Res> {
  _$AnalyzedInstructionCopyWithImpl(this._value, this._then);

  final AnalyzedInstruction _value;
  // ignore: unused_field
  final $Res Function(AnalyzedInstruction) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnalyzedInstructionCopyWith<$Res>
    implements $AnalyzedInstructionCopyWith<$Res> {
  factory _$$_AnalyzedInstructionCopyWith(_$_AnalyzedInstruction value,
          $Res Function(_$_AnalyzedInstruction) then) =
      __$$_AnalyzedInstructionCopyWithImpl<$Res>;
  @override
  $Res call({String? name, List<RecipeStep>? steps});
}

/// @nodoc
class __$$_AnalyzedInstructionCopyWithImpl<$Res>
    extends _$AnalyzedInstructionCopyWithImpl<$Res>
    implements _$$_AnalyzedInstructionCopyWith<$Res> {
  __$$_AnalyzedInstructionCopyWithImpl(_$_AnalyzedInstruction _value,
      $Res Function(_$_AnalyzedInstruction) _then)
      : super(_value, (v) => _then(v as _$_AnalyzedInstruction));

  @override
  _$_AnalyzedInstruction get _value => super._value as _$_AnalyzedInstruction;

  @override
  $Res call({
    Object? name = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$_AnalyzedInstruction(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyzedInstruction implements _AnalyzedInstruction {
  _$_AnalyzedInstruction({this.name, final List<RecipeStep>? steps})
      : _steps = steps;

  factory _$_AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyzedInstructionFromJson(json);

  @override
  final String? name;
  final List<RecipeStep>? _steps;
  @override
  List<RecipeStep>? get steps {
    final value = _steps;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnalyzedInstruction(name: $name, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyzedInstruction &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  _$$_AnalyzedInstructionCopyWith<_$_AnalyzedInstruction> get copyWith =>
      __$$_AnalyzedInstructionCopyWithImpl<_$_AnalyzedInstruction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyzedInstructionToJson(
      this,
    );
  }
}

abstract class _AnalyzedInstruction implements AnalyzedInstruction {
  factory _AnalyzedInstruction(
      {final String? name,
      final List<RecipeStep>? steps}) = _$_AnalyzedInstruction;

  factory _AnalyzedInstruction.fromJson(Map<String, dynamic> json) =
      _$_AnalyzedInstruction.fromJson;

  @override
  String? get name;
  @override
  List<RecipeStep>? get steps;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyzedInstructionCopyWith<_$_AnalyzedInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}
