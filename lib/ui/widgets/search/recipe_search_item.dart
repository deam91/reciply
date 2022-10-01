import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/hero_tag.dart';
import 'package:recipe_app/core/widgets/hero_widget.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/ui/pages/recipe_details_page.dart';
import 'package:recipe_app/ui/widgets/recipe_details/calories.dart';
import 'package:recipe_app/ui/widgets/recipe_details/servings.dart';

class RecipeSearchItem extends StatelessWidget {
  RecipeSearchItem({
    super.key,
    required this.recipe,
    required this.animation,
    required this.color,
  })  : slideAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
          ),
        ),
        fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
          ),
        ),
        imageAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
          ),
        );

  final Recipe recipe;
  final Animation<double> animation;
  final Color color;

  final Animation<Offset> slideAnimation;
  final Animation<double> fadeInAnimation;
  final Animation<Offset> imageAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final title = recipe.title?.trim() ?? '';

          return FadeTransition(
            opacity: fadeInAnimation,
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
                        fromSearch: true,
                        recipe: recipe,
                        color: color,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                height: 100,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      child: SlideTransition(
                        position: slideAnimation,
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 120.0, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      HeroWidget(
                                        tag: HeroTag.minutes(recipe,
                                            fromSearch: true),
                                        child: RecipeTime(
                                          recipe: recipe,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      HeroWidget(
                                        tag: HeroTag.servings(recipe,
                                            fromSearch: true),
                                        child: RecipeServings(
                                          recipe: recipe,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    HeroWidget(
                      tag: HeroTag.image(recipe, fromSearch: true),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: recipe.image ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
