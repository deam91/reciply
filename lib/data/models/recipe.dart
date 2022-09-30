import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@collection
@JsonSerializable()
class Recipe {
  Recipe();
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? preparationMinutes;
  int? cookingMinutes;
  @Index()
  int? aggregateLikes;
  int? healthScore;
  double? pricePerServing;
  List<ExtendedIngredientEntity>? extendedIngredients;
  Id? id;
  @Index()
  String? title;
  int? readyInMinutes;
  @Index()
  int? servings;
  String? image;
  String? summary;
  List<AnalyzedInstructionEntity>? analyzedInstructions;

  /// Connect the generated [_$RecipeEntityFromJson] function to the `fromJson`
  /// factory.
  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);

  /// Connect the generated [_$RecipeEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);
}

@embedded
@JsonSerializable()
class ExtendedIngredientEntity {
  ExtendedIngredientEntity();
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;

  /// Connect the generated [_$ExtendedIngredientEntityFromJson] function to the `fromJson`
  /// factory.
  factory ExtendedIngredientEntity.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientEntityFromJson(json);

  /// Connect the generated [_$ExtendedIngredientEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExtendedIngredientEntityToJson(this);
}

@embedded
@JsonSerializable()
class AnalyzedInstructionEntity {
  AnalyzedInstructionEntity();
  String? name;
  List<RecipeStepEntity>? steps;

  /// Connect the generated [_$AnalyzedInstructionEntityFromJson] function to the `fromJson`
  /// factory.
  factory AnalyzedInstructionEntity.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionEntityFromJson(json);

  /// Connect the generated [_$AnalyzedInstructionEntityEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnalyzedInstructionEntityToJson(this);
}

@embedded
@JsonSerializable()
class RecipeStepEntity {
  RecipeStepEntity();
  int? number;
  String? step;
  LengthEntity? length;

  /// Connect the generated [_$RecipeStepEntityFromJson] function to the `fromJson`
  /// factory.
  factory RecipeStepEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepEntityFromJson(json);

  /// Connect the generated [_$RecipeStepEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeStepEntityToJson(this);
}

@embedded
@JsonSerializable()
class LengthEntity {
  LengthEntity();
  int? number;
  String? unit;

  /// Connect the generated [_$LengthEntityFromJson] function to the `fromJson`
  /// factory.
  factory LengthEntity.fromJson(Map<String, dynamic> json) =>
      _$LengthEntityFromJson(json);

  /// Connect the generated [_$LengthEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LengthEntityToJson(this);
}
