import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bookmark.g.dart';

@collection
@JsonSerializable()
class RecipeBookmark {
  RecipeBookmark();

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? recipeId;

  int? likes;
  double? stars;

  @Index(type: IndexType.value)
  String? title;

  String? image;
  int? servings;
  double? calories;
  String? summary;
  RecipeOwnerBookmark? owner;
  DateTime? createdAt;
  int? readyInMinutes;
  int? preparationMinutes;
  List<IngredientBookmark>? ingredients;
  List<InstructionBookmark>? instructions;

  /// Connect the generated [_$RecipeBookmarkEntityFromJson] function to the `fromJson`
  /// factory.
  factory RecipeBookmark.fromJson(Map<String, dynamic> json) =>
      _$RecipeBookmarkFromJson(json);

  /// Connect the generated [_$RecipeBookmarkEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeBookmarkToJson(this);
}

@embedded
@JsonSerializable()
class RecipeOwnerBookmark {
  RecipeOwnerBookmark();
  String? name;
  String? image;

  /// Connect the generated [_$RecipeOwnerBookmarkFromJson] function to the `fromJson`
  /// factory.
  factory RecipeOwnerBookmark.fromJson(Map<String, dynamic> json) =>
      _$RecipeOwnerBookmarkFromJson(json);

  /// Connect the generated [_$RecipeOwnerBookmarkToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeOwnerBookmarkToJson(this);
}

@embedded
@JsonSerializable()
class IngredientBookmark {
  IngredientBookmark();
  int? id;
  String? name;
  double? amount;
  String? unit;

  /// Connect the generated [_$IngredientBookmarkFromJson] function to the `fromJson`
  /// factory.
  factory IngredientBookmark.fromJson(Map<String, dynamic> json) =>
      _$IngredientBookmarkFromJson(json);

  /// Connect the generated [_$IngredientBookmarkToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IngredientBookmarkToJson(this);
}

@embedded
@JsonSerializable()
class InstructionBookmark {
  InstructionBookmark();
  String? step;
  int? number;
  LengthBookmark? length;

  /// Connect the generated [_$InstructionBookmarkFromJson] function to the `fromJson`
  /// factory.
  factory InstructionBookmark.fromJson(Map<String, dynamic> json) =>
      _$InstructionBookmarkFromJson(json);

  /// Connect the generated [_$InstructionBookmarkToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InstructionBookmarkToJson(this);
}

@embedded
@JsonSerializable()
class LengthBookmark {
  LengthBookmark();
  int? number;
  String? unit;

  /// Connect the generated [_$LengthBookmarkFromJson] function to the `fromJson`
  /// factory.
  factory LengthBookmark.fromJson(Map<String, dynamic> json) =>
      _$LengthBookmarkFromJson(json);

  /// Connect the generated [_$LengthBookmarkToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LengthBookmarkToJson(this);
}
