import 'package:flutter/material.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/common/views/widgets/recipe_flow_delegate.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/stars.dart';

class RecipeSearchItem extends StatelessWidget {
  RecipeSearchItem({
    super.key,
    required this.recipe,
    required this.animation,
    required this.color,
    this.fromSearch = false,
    this.fromFavorites = false,
    this.fromProfile = false,
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
        );

  final Recipe recipe;
  final Animation<double> animation;
  final Color color;
  final bool fromSearch;
  final bool fromFavorites;
  final bool fromProfile;

  final Animation<Offset> slideAnimation;
  final Animation<double> fadeInAnimation;

  final GlobalKey _backgroundImageKey = GlobalKey();

  void _onTap(BuildContext context) {
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
            fromSearch: fromSearch,
            fromFavorites: fromFavorites,
            fromProfile: fromProfile,
            recipe: recipe,
            color: color,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final title = recipe.title?.trim() ?? '';
          final owner = recipe.owner?.name ?? '';

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeInAnimation,
              child: GestureDetector(
                onTap: () => _onTap(context),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 10.0),
                  child: HeroWidget(
                    tag: HeroTag.image(recipe,
                        fromSearch: fromSearch, fromFavorites: fromFavorites),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black38,
                              offset: Offset.zero,
                              spreadRadius: 2,
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
                                  child: Flow(
                                    delegate: RecipeFlowDelegate(
                                      scrollable: Scrollable.of(context)!,
                                      listItemContext: context,
                                      backgroundImageKey: _backgroundImageKey,
                                    ),
                                    children: [
                                      Image.network(
                                        recipe.image ?? '',
                                        key: _backgroundImageKey,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress
                                                  ?.cumulativeBytesLoaded ==
                                              loadingProgress
                                                  ?.expectedTotalBytes) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ],
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
                                  color:
                                      const Color(0xffFFE1B3).withOpacity(.8),
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
              ),
            ),
          );
        });
  }
}
