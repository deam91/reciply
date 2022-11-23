import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/auth/views/pages/login_page.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/common/views/pages/home_page.dart';
import 'package:recipe_app/dashboard/views/pages/onboarding_page.dart';

class StartupPage extends ConsumerStatefulWidget {
  const StartupPage({super.key});

  @override
  ConsumerState<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends ConsumerState<StartupPage> {
  late final Future _isOnboarded;

  @override
  void initState() {
    super.initState();
    _isOnboarded = ref.read(cacheProvider).isOnboarded();
  }

  @override
  Widget build(BuildContext context) {
    final authStateChanges = ref.watch(authControllerProvider);
    print("BUILD START_PAGE");
    switch (authStateChanges) {
      case Status.authenticated:
        return const HomePage();
      case Status.loading:
      case Status.uninitialized:
      case Status.authenticating:
      case Status.registering:
      case Status.authenticatingWithGoogle:
      case Status.unauthenticated:
      case Status.authError:
        return FutureBuilder(
          future: _isOnboarded,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final isOnboarded = snapshot.requireData;
              if (!isOnboarded) {
                return const OnboardingPage();
              } else {
                return const LoginPage();
              }
            }
            return const LoginPage();
          },
        );
    }
  }
}
