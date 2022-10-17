import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/auth/views/login_page.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/common/views/pages/home_page.dart';
import 'package:recipe_app/dashboard/views/pages/onboarding_page.dart';

class StartupPage extends ConsumerWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges =
        ref.watch(authControllerProvider.select((value) => value.status));
    if (authStateChanges == Status.authenticated) {
      return const HomePage();
    } else {
      final isOnboarded = ref.read(cacheProvider).isOnboarded();
      if (!isOnboarded) {
        return const OnboardingPage();
      } else {
        return const LoginPage();
      }
    }
  }
}
