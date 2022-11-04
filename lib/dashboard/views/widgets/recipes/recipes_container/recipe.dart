import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/hero_tag.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/stars.dart';

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.color,
    required this.size,
    this.isCurrentPage = false,
  });
  final Recipe recipe;
  final Color color;
  final Size size;
  final bool isCurrentPage;

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  bool touched = true;

  _navigateToDetailsPage() {
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
            recipe: widget.recipe,
            color: widget.color,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          // Back content
          AnimatedOpacity(
            opacity: !touched ? 0.0 : 1.0,
            duration: !touched
                ? const Duration(milliseconds: 250)
                : const Duration(milliseconds: 550),
            child: Card(
              elevation: 6,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                height: widget.size.height,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.recipe.title ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RecipeTime(
                            recipe: widget.recipe,
                            textSize: 12,
                            iconSize: 16,
                            color: Colors.black87,
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            color: Colors.black45,
                            padding: const EdgeInsets.all(0),
                            iconSize: 18,
                            constraints:
                                BoxConstraints.tight(const Size(40, 40)),
                            icon: const Icon(
                              Icons.bookmark_border_rounded,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Image
          GestureDetector(
            onTap: () {
              setState(() {
                touched = !touched;
              });
            },
            child: HeroWidget(
              tag: HeroTag.image(widget.recipe),
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 400),
                height: touched ? widget.size.height * .5 : widget.size.height,
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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.recipe.image ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: StarsWidget(
                        recipe: widget.recipe,
                      ),
                    ),
                    // Bottom start cooking
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: widget.isCurrentPage
                            ? SizedBox(
                                height: 35,
                                child: TextButton.icon(
                                  onPressed: _navigateToDetailsPage,
                                  icon: const Icon(
                                    Icons.cookie_outlined,
                                    size: 18,
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black38,
                                  ),
                                  label: const Text('Go Cooking!'),
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    // Top bookmark button
                    Positioned(
                      top: 10,
                      right: 10,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: !touched
                            ? SizedBox(
                                height: 35,
                                width: 35,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.black38),
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 18,
                                  constraints:
                                      BoxConstraints.tight(const Size(40, 40)),
                                  icon: const Icon(
                                    Icons.bookmark_border_rounded,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
