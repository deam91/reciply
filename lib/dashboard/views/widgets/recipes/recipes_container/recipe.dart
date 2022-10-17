import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/hero_tag.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/stars.dart';

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
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26,
                    offset: Offset.zero,
                    spreadRadius: 1,
                  )
                ],
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: const EdgeInsets.all(20),
              child: Container(),
            ),
          ),
          Positioned(
            top: 0,
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: HeroWidget(
              tag: HeroTag.reviews(recipe),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFE1B3).withOpacity(.7),
                ),
                height: 28,
                child: Stars(
                  likes: recipe.stars ?? 0,
                  size: 28,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroWidget(
                  tag: HeroTag.title(recipe),
                  child: Text(
                    recipe.title ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeroWidget(
                        tag: HeroTag.minutes(recipe),
                        child: RecipeTime(
                          recipe: recipe,
                          textSize: 12,
                          iconSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      HeroWidget(
                        tag: HeroTag.servings(recipe),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                          color: Colors.black45,
                          padding: const EdgeInsets.all(0),
                          iconSize: 18,
                          constraints: BoxConstraints.tight(const Size(40, 40)),
                          icon: const Icon(
                            Icons.bookmark_border_rounded,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
