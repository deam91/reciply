import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipe.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.65);
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
      padEnds: false,
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return RecipeWidget(
              recipe: widget.recipes[index],
              color: Colors.white,
              size: constraints.smallest,
              isCurrentPage: currentPage == index,
            );
          },
        );
      },
    );
  }
}
