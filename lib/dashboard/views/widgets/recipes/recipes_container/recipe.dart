import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/pages/recipe_details_page.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_time.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/stars.dart';
import 'package:recipe_app/favorites/controllers/favorites_provider.dart';

class RecipeWidget extends ConsumerStatefulWidget {
  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.color,
    required this.size,
    this.disableTouch = false,
    this.fromDashboard = false,
  });
  final Recipe recipe;
  final Color color;
  final Size size;
  final bool disableTouch;
  final bool fromDashboard;

  @override
  ConsumerState<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends ConsumerState<RecipeWidget>
    with AutomaticKeepAliveClientMixin {
  bool touched = false;
  List<String> bookmarks = [];

  @override
  bool get wantKeepAlive => true;

  void _navigateToDetailsPage() {
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
            fromDashboard: widget.fromDashboard,
          );
        },
      ),
    );
  }

  void _bookmark() async {
    await ref
        .read(bookmarkControllerProvider.notifier)
        .saveBookmark(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(bookmarkControllerProvider);
        final selectedItems =
            ref.read(bookmarkControllerProvider.notifier).bookmarkIds;
        final bookmarked = selectedItems.contains(widget.recipe.recipeId);
        return Card(
          elevation: 6,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(left: 2, right: 2, top: 20, bottom: 15),
          child: Stack(
            children: [
              // Image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: widget.size.height * .6,
                child: HeroWidget(
                  tag: HeroTag.image(widget.recipe,
                      fromDashboard: widget.fromDashboard),
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        InkWell(
                          onTap: _navigateToDetailsPage,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: widget.recipe.image != null &&
                                    widget.recipe.image != ''
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: widget.recipe.image ?? '',
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
                                  )
                                : Image.asset('assets/logo.png'),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: StarsWidget(
                            recipe: widget.recipe,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: widget.size.height * .38,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  widget.recipe.title ?? '',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              if (widget.recipe.owner != null &&
                                  widget.recipe.owner!.name != null &&
                                  widget.recipe.owner!.name!.isNotEmpty)
                                Text(
                                  'By ${widget.recipe.owner!.name}',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffa9a9a9),
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
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
                                color:
                                    bookmarked ? Colors.orange : Colors.black45,
                                padding: const EdgeInsets.all(0),
                                iconSize: 18,
                                constraints:
                                    BoxConstraints.tight(const Size(40, 40)),
                                icon: bookmarked
                                    ? const Icon(
                                        Icons.bookmark_rounded,
                                      )
                                    : const Icon(
                                        Icons.bookmark_border_rounded,
                                      ),
                                onPressed: _bookmark,
                              ),
                            ],
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
      },
    );
  }
}
