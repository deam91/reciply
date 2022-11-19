import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/common/views/widgets/search_not_found.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/filters_modal.dart';
import 'package:recipe_app/search/views/widgets/recipe_search_list.dart';
import 'package:recipe_app/search/views/widgets/search_card.dart';
import 'package:recipe_app/search/controllers/search.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController controller = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchText = controller.text;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _enter(String value) {
    setState(() {
      _searchText = value != '' ? value : controller.text;
    });
  }

  _showFiltersModalBottomSheet() async {
    final filter = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const FilterModal();
      },
    );
    if (filter != null) {
      print('filter object: ${filter.toString()}');
      ref.read(searchFilters.notifier).state = filter as SearchFilter;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('BUILT WITH $_searchText');
    final recipesWatch = ref.watch(searchProvider(_searchText));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Search recipes'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SearchCard(
                      onShowModalBottomSheet: () async {
                        await _showFiltersModalBottomSheet();
                      },
                      controller: controller,
                      onFieldSubmitted: (_) {
                        _enter(controller.text);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: recipesWatch.when(
                  data: (List<Recipe>? data) {
                    if (data == null || data.isEmpty) {
                      return const SearchNotFoundLottie();
                    }

                    return RecipeResultList(
                      recipeSearchItems: data,
                    );
                  },
                  error: (error, stack) => const SearchNotFoundLottie(),
                  loading: () => const LoadingWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
