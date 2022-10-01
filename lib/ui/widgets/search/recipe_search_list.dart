import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/ui/widgets/search/recipe_search_item.dart';

class RecipeResultList extends StatefulWidget {
  const RecipeResultList({super.key, required this.recipeSearchItems});

  final List<Recipe> recipeSearchItems;

  @override
  State<RecipeResultList> createState() => _RecipeResultListState();
}

class _RecipeResultListState extends State<RecipeResultList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final _listItems = <Recipe>[];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  _loadItems() {
    var future = Future(() {});
    for (var i = 0; i < widget.recipeSearchItems.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          _listItems.add(widget.recipeSearchItems[i]);
          _key.currentState?.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index, animation) {
        final color = index % 2 == 0 ? recipeColors[0] : recipeColors[1];
        return RecipeSearchItem(
          animation: animation,
          recipe: widget.recipeSearchItems[index],
          color: color,
        );
      },
      initialItemCount: _listItems.length,
    );
  }
}
