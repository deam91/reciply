import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';

class UserCard extends ConsumerWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref
        .watch(authControllerProvider.notifier.select((value) => value.fbUser));
    final name = user?.displayName ?? '';
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(
            user?.photoURL ?? '',
            maxHeight: 55,
            maxWidth: 55,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'What are you cooking today?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA9A9A9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
