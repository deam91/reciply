import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class SearchFilter {
  SearchFilter({
    this.time,
    this.tag,
    this.star,
  });

  final TimeEnum? time;
  final TagEnum? tag;
  final StarsEnum? star;

  @override
  String toString() {
    return '${time?.value} ${tag?.value} ${star?.value}';
  }
}

final searchFilters = StateProvider<SearchFilter>((ref) => SearchFilter());

final searchProvider =
    FutureProvider.autoDispose.family<List<Recipe>?, String>((ref, text) async {
  final filters = ref.watch(searchFilters);
  debugPrint('filter is: ${filters.toString()}');
  return ref
      .read(recipeServiceProvider.notifier)
      .search(filters: filters, text: text);
});
