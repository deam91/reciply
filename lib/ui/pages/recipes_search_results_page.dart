import 'package:flutter/material.dart';
import 'package:recipe_app/core/hero_tag.dart';
import 'package:recipe_app/core/widgets/hero_widget.dart';
import 'package:recipe_app/core/widgets/loading_widget.dart';
import 'package:recipe_app/core/widgets/search_not_found.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/data/repository/recipes_repository.dart';
import 'package:recipe_app/ui/widgets/search/recipe_search_list.dart';

class RecipeSearchResultsPage extends StatefulWidget {
  const RecipeSearchResultsPage({
    super.key,
    required this.search,
    required this.controller,
  });
  final String search;
  final TextEditingController controller;

  @override
  State<RecipeSearchResultsPage> createState() =>
      _RecipeSearchResultsPageState();
}

class _RecipeSearchResultsPageState extends State<RecipeSearchResultsPage> {
  late Future<List<Recipe>?> _future;

  @override
  void initState() {
    super.initState();
    _future = recipesRepository.searchRecipe(text: widget.search);
  }

  _search(String value) {
    setState(() {
      _future = recipesRepository.searchRecipe(text: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BackButton(color: Colors.white),
                  Expanded(
                    child: HeroWidget(
                      tag: HeroTag.mainSearchField(),
                      child: TextFormField(
                        controller: widget.controller,
                        decoration: InputDecoration(
                          iconColor: Colors.white,
                          isDense: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black45,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send_rounded,
                              size: 20,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              _search(widget.controller.text);
                            },
                          ),
                          hintText: 'Search recipes',
                          hintStyle: const TextStyle(color: Colors.black45),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          _search(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Recipe>?>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    final data = snapshot.data ?? [];
                    if (data.isEmpty) return const SearchNotFoundLottie();
                    return RecipeResultList(
                      recipeSearchItems: data,
                    );
                  }
                  return const LoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
