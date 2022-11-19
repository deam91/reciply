import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/recipe_owner.dart';

class NewRecipeItem extends StatelessWidget {
  const NewRecipeItem({Key? key, required this.recipe, required this.color})
      : super(key: key);
  final Recipe recipe;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final title = recipe.title?.trim() ?? '';
    const double verticalPadding = 10.0;
    const double horizontalPadding = 5.0;

    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: color,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                  offset: Offset.zero,
                  spreadRadius: 1,
                )
              ],
            ),
            padding: const EdgeInsets.all(10),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                          RatingBar.builder(
                            initialRating: recipe.stars ?? 1,
                            ignoreGestures: true,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      RecipeOwnerWidget(
                        recipe: recipe,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Transform.translate(
                          offset: const Offset(
                              horizontalPadding + 14, -verticalPadding - 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black38,
                                  offset: Offset.zero,
                                  spreadRadius: 1,
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
                                errorWidget: (context, url, error) {
                                  return DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: Colors.black),
                                    child: Image.asset(
                                        'assets/images/logo_white.png'),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: RecipeTime(
                          recipe: recipe,
                          textSize: 12,
                          iconSize: 16,
                          color: const Color(0xffA9A9A9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
