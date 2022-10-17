import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/constants.dart';
import 'package:recipe_app/common/hero_tag.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/stars.dart';

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
          final owner = recipe.owner?.name ?? '';

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
                child: HeroWidget(
                  tag: HeroTag.image(recipe, fromSearch: true),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black38,
                          offset: Offset.zero,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 2 / 1,
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: imageGradient,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: recipe.image ?? '',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'By $owner',
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffFFE1B3).withOpacity(.8),
                            ),
                            height: 28,
                            child: Stars(
                              likes: recipe.stars ?? 0,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
