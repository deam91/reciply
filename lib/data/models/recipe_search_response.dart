import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/models/recipe.dart';

part 'recipe_search_response.g.dart';

@JsonSerializable()
class RecipeSearchResponse {
  RecipeSearchResponse({
    required this.offset,
    required this.number,
    required this.totalResults,
    required this.results,
  });

  final int offset;
  final int number;
  final int totalResults;
  final List<Recipe>? results;

  /// Connect the generated [_$RecipeSearchResponseFromJson] function to the `fromJson`
  /// factory.
  factory RecipeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchResponseFromJson(json);

  /// Connect the generated [_$RecipeSearchResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeSearchResponseToJson(this);
}
