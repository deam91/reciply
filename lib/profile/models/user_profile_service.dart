import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/auth/models/user_profile.dart';

class UserProfileService {
  UserProfileService();

  Future<UserProfile?> getUserProfile(String? userUId) async {
    final users = FirebaseFirestore.instance.collection('users').doc(userUId);
    final snapshot = await users.get();
    if (snapshot.exists) {
      final data = snapshot.data() ?? {};
      return UserProfile.fromJson(data);
    }
    return null;
  }
}
