import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/directions/directions_list.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/ingredient/ingredients_list.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_time.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/recipe_owner.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/stars.dart';
import 'package:recipe_app/dashboard/views/widgets/tab_bar_widget.dart';
import 'package:recipe_app/favorites/controllers/favorites_provider.dart';
import 'package:recipe_app/profile/controllers/user_profile_provider.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  const RecipeDetailsPage({
    Key? key,
    required this.recipe,
    required this.color,
    this.fromSearch = false,
    this.fromFavorites = false,
    this.fromProfile = false,
    this.fromDashboard = false,
    this.fromNewRecipes = false,
  }) : super(key: key);
  final Recipe recipe;
  final Color color;
  final bool fromSearch;
  final bool fromFavorites;
  final bool fromProfile;
  final bool fromDashboard;
  final bool fromNewRecipes;

  @override
  ConsumerState<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int _itemsCount = 0;

  void _bookmark() async {
    await ref
        .read(bookmarkControllerProvider.notifier)
        .saveBookmark(widget.recipe);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _itemsCount = widget.recipe.ingredients?.length ?? 0;
    tabController.addListener(() {
      setState(() {
        if (tabController.index == 0) {
          _itemsCount = widget.recipe.ingredients?.length ?? 0;
        }
        if (tabController.index == 1) {
          _itemsCount = widget.recipe.instructions?.length ?? 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BUILD RecipeDetailsPage');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            highlightColor: Colors.white12,
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.black87,
            ),
          )
        ],
      ),
      extendBody: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 1,
                    child: HeroWidget(
                      tag: HeroTag.image(
                        widget.recipe,
                        fromSearch: widget.fromSearch,
                        fromFavorites: widget.fromFavorites,
                        fromProfile: widget.fromProfile,
                        fromDashboard: widget.fromDashboard,
                        fromNewRecipes: widget.fromNewRecipes,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: imageGradient,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: widget.recipe.image != null &&
                                  widget.recipe.image != ''
                              ? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.recipe.image ?? '',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 1),
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
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RecipeTime(
                          recipe: widget.recipe,
                          color: Colors.white70,
                          iconSize: 16,
                          textSize: 14,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            ref.watch(bookmarkControllerProvider);
                            final selectedItems = ref
                                .read(bookmarkControllerProvider.notifier)
                                .bookmarkIds;
                            final bookmarked =
                                selectedItems.contains(widget.recipe.recipeId);
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: IconButton(
                                key: ValueKey('bookmarked_$bookmarked'),
                                style: IconButton.styleFrom(
                                    backgroundColor:
                                        Colors.white.withOpacity(.4)),
                                color:
                                    bookmarked ? Colors.orange : Colors.black45,
                                padding: const EdgeInsets.all(0),
                                iconSize: 18,
                                constraints:
                                    BoxConstraints.tight(const Size(30, 30)),
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 1200),
                                  child: bookmarked
                                      ? const Icon(
                                          Icons.bookmark_rounded,
                                        )
                                      : const Icon(
                                          Icons.bookmark_border_rounded,
                                          color: Colors.white,
                                        ),
                                ),
                                onPressed: _bookmark,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: StarsWidget(recipe: widget.recipe),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Title & reviews
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.recipe.title ?? '',
                          maxLines: 3,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.thumb_up_sharp,
                          size: 18.0,
                        ),
                        label: Text(
                          widget.recipe.likes.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Owner & Follow button
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: RecipeOwnerWidget(
                            recipe: widget.recipe,
                            textColor: Colors.black87,
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final userId = ref
                              .read(authControllerProvider.notifier)
                              .fbUser
                              ?.uid;
                          if (widget.recipe.ownerId == userId) {
                            return const SizedBox.shrink();
                          }
                          return OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(userProfileProvider.notifier)
                                  .followUser(widget.recipe.ownerId);
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xff129575),
                              foregroundColor: Colors.white24,
                              elevation: 6,
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  // Ingredients & Directions tabs
                  const SizedBox(
                    height: 10,
                  ),
                  TabBarWidget(tabController: tabController),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.people_outline_rounded,
                            color: Colors.black26,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.recipe.servings} serves',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$_itemsCount items',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        IngredientsList(
                            ingredients: widget.recipe.ingredients ?? []),
                        DirectionsList(
                            instructions: widget.recipe.instructions ?? []),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
