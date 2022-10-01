// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSearchResponse _$RecipeSearchResponseFromJson(
        Map<String, dynamic> json) =>
    RecipeSearchResponse(
      offset: json['offset'] as int,
      number: json['number'] as int,
      totalResults: json['totalResults'] as int,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeSearchResponseToJson(
        RecipeSearchResponse instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'number': instance.number,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };
