import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/constants.dart';
import 'package:recipe_app/common/hero_tag.dart';
import 'package:recipe_app/common/views/widgets/hero_widget.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/directions/directions_list.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/ingredient/ingredients_list.dart';
import 'package:recipe_app/dashboard/views/widgets/recipe_details/stars.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/recipe_owner.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({
    Key? key,
    required this.recipe,
    required this.color,
    this.fromSearch = false,
  }) : super(key: key);
  final Recipe recipe;
  final Color color;
  final bool fromSearch;

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int _itemsCount = 0;

  @override
  initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _itemsCount = widget.recipe.ingredients?.length ?? 0;
    tabController.addListener(() {
      setState(() {
        if (tabController.index == 0)
          _itemsCount = widget.recipe.ingredients?.length ?? 0;
        if (tabController.index == 1)
          _itemsCount = widget.recipe.instructions?.length ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD RecipeDetailsPage');
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 1,
                    child: HeroWidget(
                      tag: HeroTag.image(widget.recipe,
                          fromSearch: widget.fromSearch),
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: imageGradient,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.recipe.image ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const Center(
                              child: CircularProgressIndicator(strokeWidth: 1),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
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
                          iconSize: 20,
                          textSize: 16,
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                          color: Colors.black45,
                          padding: const EdgeInsets.all(0),
                          iconSize: 20,
                          constraints: BoxConstraints.tight(const Size(30, 30)),
                          icon: const Icon(
                            Icons.bookmark_border_rounded,
                          ),
                          onPressed: () {},
                        ),
                      ],
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
                        likes: widget.recipe.stars ?? 0,
                        size: 28,
                      ),
                    ),
                  ),
                ],
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
                          child: HeroWidget(
                            tag: HeroTag.title(widget.recipe,
                                fromSearch: widget.fromSearch),
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
                        ),
                        Text(
                          '(${widget.recipe.likes.toString()} likes)',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    // Owner & Follow button
                    Row(
                      children: [
                        Expanded(
                          child: RecipeOwnerWidget(
                            recipe: widget.recipe,
                            textColor: Colors.black87,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
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
                        ),
                      ],
                    ),
                    // Ingredients & Directions tabs
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                      splashBorderRadius: BorderRadius.circular(25),
                      indicatorColor: const Color(0xff129575),
                      labelColor: const Color(0xff129575),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black45,
                      tabs: const <Tab>[
                        Tab(
                          text: 'Ingredients',
                          height: 40,
                        ),
                        Tab(
                          text: 'Directions',
                          height: 40,
                        ),
                      ],
                      controller: tabController,
                    ),
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
      ),
    );
  }
}

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    Key? key,
    required this.recipe,
    this.iconSize,
    this.textSize,
    this.color,
  }) : super(key: key);

  final Recipe recipe;
  final double? iconSize;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Icon(
            Icons.timer_outlined,
            size: iconSize,
            color: color,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '${recipe.readyInMinutes} min',
            style: TextStyle(
              fontSize: textSize ?? 18,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
