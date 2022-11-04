import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/dashboard/controllers/recipes_providers.dart';
import 'package:recipe_app/profile/models/user_profile_service.dart';

import '../../auth/models/user_profile.dart';

final userProfileProvider = StateProvider((ref) {
  final userProfileService = UserProfileService();
  return UserProfileNotifier(ref: ref, userProfileService: userProfileService);
});

class UserProfileNotifier {
  UserProfileNotifier({required this.ref, required this.userProfileService});

  final UserProfileService userProfileService;
  final Ref ref;
  late final UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  Future<UserProfile?> getUserProfile() async {
    if (kDebugMode) {
      print('Getting user profile...');
    }
    final user = ref.read(authControllerProvider).fbUser;
    final userProfile = await userProfileService.getUserProfile(user?.uid);
    _userProfile = userProfile;
    return userProfile;
  }
}

final userProfile = FutureProvider((ref) {
  return ref.read(userProfileProvider).getUserProfile();
});

final userRecipes = FutureProvider((ref) {
  final user =
      ref.watch(authControllerProvider.select((value) => value.fbUser));
  return ref.read(recipeServiceProvider).userRecipes(userId: user?.uid);
});
