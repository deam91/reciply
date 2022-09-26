// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'length.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Length _$LengthFromJson(Map<String, dynamic> json) {
  return _Length.fromJson(json);
}

/// @nodoc
mixin _$Length {
  int? get number => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LengthCopyWith<Length> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LengthCopyWith<$Res> {
  factory $LengthCopyWith(Length value, $Res Function(Length) then) =
      _$LengthCopyWithImpl<$Res>;
  $Res call({int? number, String? unit});
}

/// @nodoc
class _$LengthCopyWithImpl<$Res> implements $LengthCopyWith<$Res> {
  _$LengthCopyWithImpl(this._value, this._then);

  final Length _value;
  // ignore: unused_field
  final $Res Function(Length) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LengthCopyWith<$Res> implements $LengthCopyWith<$Res> {
  factory _$$_LengthCopyWith(_$_Length value, $Res Function(_$_Length) then) =
      __$$_LengthCopyWithImpl<$Res>;
  @override
  $Res call({int? number, String? unit});
}

/// @nodoc
class __$$_LengthCopyWithImpl<$Res> extends _$LengthCopyWithImpl<$Res>
    implements _$$_LengthCopyWith<$Res> {
  __$$_LengthCopyWithImpl(_$_Length _value, $Res Function(_$_Length) _then)
      : super(_value, (v) => _then(v as _$_Length));

  @override
  _$_Length get _value => super._value as _$_Length;

  @override
  $Res call({
    Object? number = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_Length(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Length implements _Length {
  _$_Length({this.number, this.unit});

  factory _$_Length.fromJson(Map<String, dynamic> json) =>
      _$$_LengthFromJson(json);

  @override
  final int? number;
  @override
  final String? unit;

  @override
  String toString() {
    return 'Length(number: $number, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Length &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$_LengthCopyWith<_$_Length> get copyWith =>
      __$$_LengthCopyWithImpl<_$_Length>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LengthToJson(
      this,
    );
  }
}

abstract class _Length implements Length {
  factory _Length({final int? number, final String? unit}) = _$_Length;

  factory _Length.fromJson(Map<String, dynamic> json) = _$_Length.fromJson;

  @override
  int? get number;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_LengthCopyWith<_$_Length> get copyWith =>
      throw _privateConstructorUsedError;
}
