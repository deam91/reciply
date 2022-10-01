import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants.dart';
import 'package:recipe_app/core/hero_tag.dart';
import 'package:recipe_app/data/models/models.dart';
import 'package:recipe_app/ui/widgets/recipe_details/calories.dart';
import 'package:recipe_app/ui/widgets/recipe_details/directions/directions_list.dart';
import 'package:recipe_app/core/widgets/hero_widget.dart';
import 'package:recipe_app/ui/widgets/recipe_details/ingredient/ingredients_list.dart';
import 'package:recipe_app/ui/widgets/recipe_details/servings.dart';
import 'package:recipe_app/ui/widgets/recipe_details/stars.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({
    Key? key,
    required this.recipe,
    required this.color,
    this.fromSearch = false,
  }) : super(key: key);
  final Recipe recipe;
  final Color color;
  final bool fromSearch;

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD RecipeDetailsPage');
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 22),
        unselectedIconTheme:
            const IconThemeData(color: Colors.black38, size: 22),
        enableFeedback: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        mouseCursor: SystemMouseCursors.click,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: bottomNavBarItems,
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    // top colored section
                    Positioned.fill(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: HeroWidget(
                        tag: HeroTag.section(widget.recipe,
                            fromSearch: widget.fromSearch),
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(50.0)),
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            top: kToolbarHeight,
                          ),
                        ),
                      ),
                    ),
                    // top buttons
                    Positioned(
                      top: kToolbarHeight,
                      height: kToolbarHeight,
                      width: constraints.maxWidth,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              color: Colors.white,
                              iconSize: 24,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            IconButton(
                              onPressed: () {},
                              iconSize: 24,
                              highlightColor: Colors.white12,
                              icon: const Icon(
                                Icons.notifications_none_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // content
                    Positioned(
                      top: kToolbarHeight + 40,
                      left: 0,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeroWidget(
                              tag: HeroTag.title(widget.recipe,
                                  fromSearch: widget.fromSearch),
                              child: Text(
                                widget.recipe.title ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HeroWidget(
                                  tag: HeroTag.divider(widget.recipe,
                                      fromSearch: widget.fromSearch),
                                  child: Divider(color: Colors.orange[200]),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            HeroWidget(
                                              tag: HeroTag.minutes(
                                                  widget.recipe,
                                                  fromSearch:
                                                      widget.fromSearch),
                                              child: RecipeTime(
                                                recipe: widget.recipe,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            HeroWidget(
                                              tag: HeroTag.servings(
                                                  widget.recipe,
                                                  fromSearch:
                                                      widget.fromSearch),
                                              child: RecipeServings(
                                                recipe: widget.recipe,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Calories(
                                              recipe: widget.recipe,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            HeroWidget(
                                              tag: HeroTag.reviews(
                                                  widget.recipe,
                                                  fromSearch:
                                                      widget.fromSearch),
                                              child: Stars(
                                                likes: widget.recipe
                                                        .aggregateLikes ??
                                                    0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .5,
                      right: -10,
                      width: constraints.maxWidth / 2,
                      height: constraints.maxHeight * .45,
                      child: HeroWidget(
                        tag: HeroTag.image(widget.recipe,
                            fromSearch: widget.fromSearch),
                        child: Container(
                          height: constraints.maxHeight * .45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Colors.black38,
                                offset: Offset.zero,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.recipe.image ?? '',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 1),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              foregroundDecoration: BoxDecoration(
                gradient: whiteBottomGradient,
              ),
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        color: backgroundColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IngredientsList(
                        extendedIngredients:
                            widget.recipe.extendedIngredients ?? []),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Directions',
                      style: TextStyle(
                        color: backgroundColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DirectionsList(
                        analyzedInstructions:
                            widget.recipe.analyzedInstructions ?? []),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          const Icon(
            Icons.timelapse,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '${recipe.readyInMinutes} min',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
