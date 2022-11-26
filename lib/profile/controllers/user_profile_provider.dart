import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/profile/models/user_profile_service.dart';

import '../../auth/models/user_profile.dart';

final userProfileProvider =
    AutoDisposeAsyncNotifierProvider<UserProfileNotifier, UserProfile?>(
        UserProfileNotifier.new);

class UserProfileNotifier extends AutoDisposeAsyncNotifier<UserProfile?> {
  late final UserProfileService userProfileService;
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  void followUser(String? followedUserUId) {
    final user = ref.read(authControllerProvider.notifier).fbUser;
    userProfileService.followUser(user?.uid, followedUserUId);
  }

  void getUserProfile() {
    if (kDebugMode) {
      print('Register user profile stream...');
    }
    final user = ref.read(authControllerProvider.notifier).fbUser;
    final stream = userProfileService.userProfileStream(user?.uid);
    stream.listen((event) async {
      state = const AsyncLoading();
      final data = event.data() ?? {};
      final userProfile = UserProfile.fromJson(data);
      debugPrint(userProfile.name);
      if (this.userProfile != null &&
          this.userProfile?.recipes != userProfile.recipes) {
        ref.refresh(userRecipes);
      }
      _userProfile = userProfile;
      state = AsyncData(userProfile);
    });
  }

  Future<int> followers(String? userUID) async {
    return userProfileService.followers(userUID);
  }

  Future<int> recipesCount(String? userUID) async {
    return userProfileService.recipesCount(userUID);
  }

  @override
  UserProfile? build() {
    userProfileService = UserProfileService();
    getUserProfile();
    return null;
  }
}

final userRecipes = FutureProvider((ref) {
  final user = ref.read(authControllerProvider.notifier).fbUser;
  return ref
      .read(recipeServiceProvider.notifier)
      .userRecipes(userId: user?.uid);
});

final userFollowers = FutureProvider((ref) {
  final user = ref
      .watch(authControllerProvider.notifier.select((value) => value.fbUser));
  return ref.read(userProfileProvider.notifier).followers(user?.uid);
});

final userRecipesCount = FutureProvider((ref) {
  final user = ref
      .watch(authControllerProvider.notifier.select((value) => value.fbUser));
  return ref.read(userProfileProvider.notifier).recipesCount(user?.uid);
});
