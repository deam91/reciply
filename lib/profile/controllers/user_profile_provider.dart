import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
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
    final user = ref.read(authControllerProvider).fbUser;
    _userProfile = await userProfileService.getUserProfile(user?.uid);
    return _userProfile;
  }
}

final userProfile = FutureProvider((ref) {
  return ref.read(userProfileProvider).getUserProfile();
});
