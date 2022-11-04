import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/models/data_sources/recipes_api_service.dart';

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
  print('filter is: ${filters.toString()}');
  return ref.read(recipeServiceProvider).search(filters: filters, text: text);
});

final getRecipesProvider =
    FutureProvider.autoDispose.family<List<Recipe>?, TagEnum>((ref, tag) async {
  return ref.read(recipeServiceProvider).getRecipes(tag: tag);
});

final getNewestRecipesProvider =
    FutureProvider.autoDispose<List<Recipe>?>((ref) async {
  return ref.read(recipeServiceProvider).newRecipes();
});

final recipeServiceProvider = Provider<RecipesNotifier>((ref) {
  final recipeService = RecipeService();
  return RecipesNotifier(recipeService: recipeService);
});

class RecipesNotifier {
  RecipesNotifier({required this.recipeService});
  String _currentSearch = '';

  final RecipeService recipeService;

  String currentSearch() => _currentSearch;

  Future<List<Recipe>?> search(
      {SearchFilter? filters, String text = ''}) async {
    return recipeService.searchRecipes(filters: filters, text: text);
  }

  Future<List<Recipe>?> getRecipes({TagEnum? tag}) async {
    print('Getting data for tag: ${tag?.value}');
    return recipeService.getRecipes(tag: tag);
  }

  Future<List<Recipe>?> newRecipes() async {
    final filter = SearchFilter(time: TimeEnum.newest);
    return recipeService.searchRecipes(filters: filter);
  }

  Future<List<Recipe>?> userRecipes({String? userId = ''}) async {
    return recipeService.userRecipes(userId: userId);
  }
}
