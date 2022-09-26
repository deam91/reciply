import 'package:freezed_annotation/freezed_annotation.dart';

part 'length.freezed.dart';
part 'length.g.dart';

@freezed
class Length with _$Length {
  factory Length({
    int? number,
    String? unit,
  }) = _Length;

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);
}
