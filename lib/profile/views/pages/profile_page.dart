import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/profile/views/widgets/user_brand.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            iconSize: 24,
            highlightColor: Colors.white12,
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: UserBrand(),
          ),
        ],
      ),
    );
  }
}
