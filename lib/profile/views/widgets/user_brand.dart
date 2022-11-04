import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/common/views/widgets/search_not_found.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/search/recipe_search_list.dart';
import 'package:recipe_app/profile/controllers/user_profile_provider.dart';

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
    final fbUser =
        ref.watch(authControllerProvider.select((value) => value.fbUser));
    final profile = ref.watch(userProfile);
    final recipes = ref.watch(userRecipes);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  foregroundImage: CachedNetworkImageProvider(
                    fbUser?.photoURL ?? '',
                  ),
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Recipes',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Followers',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    '10M',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Following',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    '3432',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
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
          profile.when(
            data: (data) {
              return Column(
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
              );
            },
            error: (error, stack) => const LoadingWidget(),
            loading: () => const LoadingWidget(),
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
