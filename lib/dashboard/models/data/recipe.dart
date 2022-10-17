import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  Recipe();
  String? recipeId;
  int? likes;
  double? stars;
  String? title;
  String? image;
  int? servings;
  double? calories;
  String? summary;
  RecipeOwner? owner;
  Timestamp? createdAt;
  int? readyInMinutes;
  int? preparationMinutes;
  List<Ingredient>? ingredients;
  List<Instruction>? instructions;

  /// Connect the generated [_$RecipeEntityFromJson] function to the `fromJson`
  /// factory.
  factory Recipe.fromJson(Map<String, dynamic> json, String recipeId) =>
      _$RecipeFromJson(json, recipeId);

  /// Connect the generated [_$RecipeEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class RecipeOwner {
  RecipeOwner();
  String? name;
  String? image;

  /// Connect the generated [_$RecipeOwnerFromJson] function to the `fromJson`
  /// factory.
  factory RecipeOwner.fromJson(Map<String, dynamic> json) =>
      _$RecipeOwnerFromJson(json);

  /// Connect the generated [_$RecipeOwnerToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeOwnerToJson(this);
}

@JsonSerializable()
class Ingredient {
  Ingredient();
  int? id;
  String? name;
  double? amount;
  String? unit;

  /// Connect the generated [_$IngredientFromJson] function to the `fromJson`
  /// factory.
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  /// Connect the generated [_$IngredientToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Instruction {
  Instruction();
  String? step;
  int? number;
  Length? length;

  /// Connect the generated [_$InstructionFromJson] function to the `fromJson`
  /// factory.
  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  /// Connect the generated [_$InstructionToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}

@JsonSerializable()
class Length {
  Length();
  int? number;
  String? unit;

  /// Connect the generated [_$LengthFromJson] function to the `fromJson`
  /// factory.
  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);

  /// Connect the generated [_$LengthToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LengthToJson(this);
}
