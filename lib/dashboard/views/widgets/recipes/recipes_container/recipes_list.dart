import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipe.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({
    super.key,
    required this.recipes,
    this.fromDashboard = false,
  });
  final List<Recipe> recipes;
  final bool fromDashboard;

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late final PageController pageController;
  int currentPage = 0;
  double? currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.65);
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (page) => setState(() => currentPage = page),
      itemCount: widget.recipes.length,
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final scale = max(0.8, (1 - (currentPageValue! - index).abs()));

        return Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return RecipeWidget(
                recipe: widget.recipes[index],
                color: Colors.white,
                size: constraints.smallest,
                disableTouch: currentPage != index,
                fromDashboard: widget.fromDashboard,
              );
            },
          ),
        );
      },
    );
  }
}
