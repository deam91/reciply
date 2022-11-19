import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/auth/models/user_profile.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/common/views/widgets/search_not_found.dart';
import 'package:recipe_app/search/views/widgets/recipe_search_list.dart';
import 'package:recipe_app/profile/controllers/user_profile_provider.dart';
import 'package:recipe_app/profile/views/widgets/user_stats.dart';

class UserBrand extends ConsumerStatefulWidget {
  const UserBrand({Key? key}) : super(key: key);

  @override
  ConsumerState<UserBrand> createState() => _UserBrandState();
}

class _UserBrandState extends ConsumerState<UserBrand>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final fbUser = ref
        .watch(authControllerProvider.notifier.select((value) => value.fbUser));
    final profile = ref.watch(userProfileProvider);
    final recipes = ref.watch(userRecipes);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profile.when(
            data: (data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserStats(
                    imageUrl: fbUser?.photoURL,
                    following: data?.following ?? 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fbUser?.displayName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.work ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data?.aboutMe ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black87,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stack) => const LoadingWidget(),
            loading: () => const Center(
              child: LoadingWidget(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TabBar(
            splashBorderRadius: BorderRadius.circular(25),
            indicatorColor: const Color(0xff129575),
            labelColor: const Color(0xff129575),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black45,
            tabs: const <Tab>[
              Tab(
                text: 'Recipes',
                height: 40,
              ),
            ],
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              children: [
                recipes.when(
                  data: (data) {
                    if (data == null || data.isEmpty) {
                      return const SearchNotFoundLottie();
                    }
                    return RecipeResultList(
                      showHeader: false,
                      recipeSearchItems: data,
                    );
                  },
                  error: (error, stack) {
                    return const SearchNotFoundLottie();
                  },
                  loading: () => const LoadingWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
