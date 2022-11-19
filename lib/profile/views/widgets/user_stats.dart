import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/profile/controllers/user_profile_provider.dart';

class UserStats extends ConsumerWidget {
  const UserStats({
    super.key,
    this.imageUrl,
    this.recipes,
    this.following,
    this.followers,
  });
  final String? imageUrl;
  final int? recipes;
  final int? following;
  final int? followers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(userRecipesCount);
    final followers = ref.watch(userFollowers);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Image.asset('assets/images/logo_white.png'),
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            const Text(
              'Recipes',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            recipes.maybeWhen(
              data: (data) => Text(
                data.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              loading: () => const LoadingWidget(),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'Followers',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            followers.when(
              data: (data) {
                return Text(
                  data.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
              loading: () => const LoadingWidget(),
              error: (err, stack) => const SizedBox.shrink(),
            )
          ],
        ),
        Column(
          children: [
            const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            Text(
              (following ?? '0').toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
