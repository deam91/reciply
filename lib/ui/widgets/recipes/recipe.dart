import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/hero_tag.dart';
import 'package:recipe_app/core/widgets/hero_widget.dart';
import 'package:recipe_app/data/models/models.dart';
import 'package:recipe_app/ui/pages/recipe_details_page.dart';
import 'package:recipe_app/ui/widgets/recipe_details/stars.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.color,
    required this.size,
  });
  final Recipe recipe;
  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          HeroWidget(
            tag: HeroTag.section(recipe),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: const EdgeInsets.all(20),
              child: Container(),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final widgetAnimation = CurvedAnimation(
                          curve: Curves.easeInOut, parent: animation);
                      return FadeTransition(
                        opacity: widgetAnimation,
                        child: child,
                      );
                    },
                    pageBuilder: (_, animation, secondaryAnimation) {
                      return RecipeDetailsPage(
                        recipe: recipe,
                        color: color,
                      );
                    },
                  ),
                );
              },
              child: HeroWidget(
                tag: HeroTag.image(recipe),
                child: Center(
                  child: Container(
                    height: size.height * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
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
                        imageUrl: recipe.image ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroWidget(
                  tag: HeroTag.title(recipe),
                  child: Text(
                    recipe.title ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                HeroWidget(
                  tag: HeroTag.divider(recipe),
                  child: Divider(color: Colors.orange[200]),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeroWidget(
                              tag: HeroTag.minutes(recipe),
                              child: FittedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.timelapse,
                                      size: 19,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '${recipe.readyInMinutes} min',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            HeroWidget(
                              tag: HeroTag.servings(recipe),
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 19,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '${recipe.servings} servings',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    HeroWidget(
                      tag: HeroTag.reviews(recipe),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Stars(
                          likes: recipe.aggregateLikes ?? 0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
