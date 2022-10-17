// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json, String recipeId) => Recipe()
  ..recipeId = recipeId
  ..likes = json['likes'] as int?
  ..stars = (json['stars'] as num?)?.toDouble()
  ..title = json['title'] as String?
  ..image = json['image'] as String?
  ..servings = json['servings'] as int?
  ..calories = (json['calories'] as num?)?.toDouble()
  ..summary = json['summary'] as String?
  ..owner = json['owner'] == null
      ? null
      : RecipeOwner.fromJson(json['owner'] as Map<String, dynamic>)
  ..createdAt = json['createdAt'] as Timestamp?
  ..readyInMinutes = json['readyInMinutes'] as int?
  ..preparationMinutes = json['preparationMinutes'] as int?
  ..ingredients = (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList()
  ..instructions = (json['instructions'] as List<dynamic>?)
      ?.map((e) => Instruction.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'likes': instance.likes,
      'stars': instance.stars,
      'title': instance.title,
      'image': instance.image,
      'servings': instance.servings,
      'calories': instance.calories,
      'summary': instance.summary,
      'owner': instance.owner,
      'createdAt': instance.createdAt,
      'readyInMinutes': instance.readyInMinutes,
      'preparationMinutes': instance.preparationMinutes,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
    };

RecipeOwner _$RecipeOwnerFromJson(Map<String, dynamic> json) => RecipeOwner()
  ..name = json['name'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$RecipeOwnerToJson(RecipeOwner instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..amount = (json['amount'] as num?)?.toDouble()
  ..unit = json['unit'] as String?;

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };

Instruction _$InstructionFromJson(Map<String, dynamic> json) => Instruction()
  ..step = json['step'] as String?
  ..number = json['number'] as int?
  ..length = json['length'] == null
      ? null
      : Length.fromJson(json['length'] as Map<String, dynamic>);

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'step': instance.step,
      'number': instance.number,
      'length': instance.length,
    };

Length _$LengthFromJson(Map<String, dynamic> json) => Length()
  ..number = json['number'] as int?
  ..unit = json['unit'] as String?;

Map<String, dynamic> _$LengthToJson(Length instance) => <String, dynamic>{
      'number': instance.number,
      'unit': instance.unit,
    };
