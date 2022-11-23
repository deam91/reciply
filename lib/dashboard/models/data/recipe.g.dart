// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map json, String? recipeId) => Recipe()
  ..recipeId = recipeId
  ..ownerId = json['ownerId'] as String?
  ..likes = json['likes'] as int?
  ..stars = (json['stars'] as num?)?.toDouble()
  ..title = json['title'] as String?
  ..image = json['image'] as String?
  ..servings = json['servings'] as int?
  ..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..calories = (json['calories'] as num?)?.toDouble()
  ..summary = json['summary'] as String?
  ..owner = json['owner'] == null
      ? null
      : RecipeOwner.fromJson(Map<String, dynamic>.from(json['owner'] as Map))
  ..createdAt = timestampFromJson(json['createdAt'])
  ..readyInMinutes = json['readyInMinutes'] as int?
  ..preparationMinutes = json['preparationMinutes'] as int?
  ..ingredients = (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..instructions = (json['instructions'] as List<dynamic>?)
      ?.map((e) => Instruction.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'ownerId': instance.ownerId,
      'likes': instance.likes,
      'stars': instance.stars,
      'title': instance.title,
      'image': instance.image,
      'servings': instance.servings,
      'tags': instance.tags,
      'calories': instance.calories,
      'summary': instance.summary,
      'owner': instance.owner?.toJson(),
      'createdAt': timestampToJson(instance.createdAt),
      'readyInMinutes': instance.readyInMinutes,
      'preparationMinutes': instance.preparationMinutes,
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
      'instructions': instance.instructions?.map((e) => e.toJson()).toList(),
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

Instruction _$InstructionFromJson(Map json) => Instruction()
  ..step = json['step'] as String?
  ..number = json['number'] as int?
  ..length = json['length'] == null
      ? null
      : Length.fromJson(Map<String, dynamic>.from(json['length'] as Map));

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'step': instance.step,
      'number': instance.number,
      'length': instance.length?.toJson(),
    };

Length _$LengthFromJson(Map<String, dynamic> json) => Length()
  ..number = json['number'] as int?
  ..unit = json['unit'] as String?;

Map<String, dynamic> _$LengthToJson(Length instance) => <String, dynamic>{
      'number': instance.number,
      'unit': instance.unit,
    };
