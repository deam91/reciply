import 'package:flutter/material.dart';
import 'package:recipe_app/common/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/search/recipe_search_item.dart';

class RecipeResultList extends StatefulWidget {
  const RecipeResultList({
    super.key,
    required this.recipeSearchItems,
    this.showHeader = true,
  });

  final List<Recipe> recipeSearchItems;
  final bool showHeader;

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
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        if (widget.showHeader)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Search result'),
              Text(
                '${widget.recipeSearchItems.length} results',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        Expanded(
          child: AnimatedList(
            key: _key,
            padding: const EdgeInsets.all(14),
            itemBuilder: (context, index, animation) {
              final color = index % 2 == 0 ? recipeColors[0] : recipeColors[1];
              return RecipeSearchItem(
                animation: animation,
                recipe: widget.recipeSearchItems[index],
                color: color,
              );
            },
            initialItemCount: _listItems.length,
          ),
        ),
      ],
    );
  }
}
