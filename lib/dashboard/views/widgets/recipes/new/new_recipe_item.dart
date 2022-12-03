import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_time.dart';

class NewRecipeItem extends StatelessWidget {
  const NewRecipeItem({
    Key? key,
    required this.recipe,
    required this.color,
    this.disableTouch = false,
  }) : super(key: key);
  final Recipe recipe;
  final Color color;
  final bool disableTouch;

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final widgetAnimation =
              CurvedAnimation(curve: Curves.easeInOut, parent: animation);
          return FadeTransition(
            opacity: widgetAnimation,
            child: child,
          );
        },
        pageBuilder: (_, animation, secondaryAnimation) {
          return RecipeDetailsPage(
            recipe: recipe,
            color: color,
            fromNewRecipes: true,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = recipe.title?.trim() ?? '';
    const double verticalPadding = 50.0;
    const double horizontalPadding = 15.0;

    return Container(
      margin: const EdgeInsets.only(
        bottom: verticalPadding,
        top: horizontalPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.black38,
                      offset: Offset.zero,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: InkWell(
                  onTap: () => _navigateToDetailsPage(context),
                  child: HeroWidget(
                    tag: HeroTag.image(recipe, fromNewRecipes: true),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: recipe.image != null && recipe.image != ''
                          ? AspectRatio(
                              aspectRatio: 1 / 1,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: recipe.image ?? '',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) {
                                  return DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: Colors.black),
                                    child: Image.asset(
                                        'assets/images/logo_white.png'),
                                  );
                                },
                              ),
                            )
                          : Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(0), right: Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black26,
                        offset: Offset.zero,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                      if (recipe.owner?.name != null)
                        Text(
                          'By ${recipe.owner?.name}',
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA9A9A9),
                          ),
                        ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: recipe.stars ?? 1,
                            ignoreGestures: true,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                          ),
                          RecipeTime(
                            recipe: recipe,
                            textSize: 12,
                            iconSize: 15,
                            color: const Color(0xffA9A9A9),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
