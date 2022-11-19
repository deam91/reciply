import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/favorites/controllers/favorites_provider.dart';
import 'package:recipe_app/favorites/views/widgets/favorites_animated_list.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final favorites = ref.watch(bookmarkControllerProvider);
              return favorites.when(
                data: (favorites) {
                  debugPrint("FAVORITE RECIPES ${favorites.length}");
                  return FavoritesAnimatedList(favorites: favorites);
                },
                loading: () => const LoadingWidget(),
                error: (error, stackTrace) {
                  debugPrint(error.toString());
                  debugPrint(stackTrace.toString());
                  return Container();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
