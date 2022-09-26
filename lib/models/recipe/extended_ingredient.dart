import 'package:freezed_annotation/freezed_annotation.dart';

part 'extended_ingredient.freezed.dart';
part 'extended_ingredient.g.dart';

@freezed
class ExtendedIngredient with _$ExtendedIngredient {
  factory ExtendedIngredient({
    int? id,
    String? aisle,
    String? image,
    String? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    double? amount,
    String? unit,
  }) = _ExtendedIngredient;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);
}
