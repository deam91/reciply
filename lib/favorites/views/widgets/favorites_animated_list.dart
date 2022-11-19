import 'package:flutter/material.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

import '../../../search/views/widgets/recipe_search_item.dart';

class FavoritesAnimatedList extends StatefulWidget {
  FavoritesAnimatedList({super.key, required this.favorites});
  final List<Recipe> favorites;

  @override
  State<FavoritesAnimatedList> createState() => _FavoritesAnimatedListState();
}

class _FavoritesAnimatedListState extends State<FavoritesAnimatedList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  final _listItems = <Recipe>[];

  @override
  void initState() {
    super.initState();
    _loadItems(favorites: widget.favorites);
  }

  _loadItems({required List<Recipe> favorites, bool clean = false}) {
    if (clean) {
      _listItems.clear();
      for (var i = 0; i <= _listItems.length - 1; i++) {
        _key.currentState?.removeItem(0,
            (BuildContext context, Animation<double> animation) {
          return const SizedBox.shrink();
        });
      }
    }
    var future = Future(() {});
    for (var i = 0; i < favorites.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          _listItems.add(favorites[i]);
          _key.currentState?.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      padding: const EdgeInsets.all(14),
      itemBuilder: (context, index, animation) {
        final color = index % 2 == 0 ? recipeColors[0] : recipeColors[1];
        return RecipeSearchItem(
          animation: animation,
          recipe: _listItems[index],
          color: color,
          fromFavorites: true,
        );
      },
      initialItemCount: _listItems.length,
    );
  }
}
