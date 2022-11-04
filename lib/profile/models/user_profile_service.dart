import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/models/user_profile.dart';

class UserProfileService {
  UserProfileService();

  Future<UserProfile?> getUserProfile(String? userUId) async {
    try {
      final users = FirebaseFirestore.instance.collection('users').doc(userUId);
      final user = await users.get();
      final data = user.data() ?? {};
      return UserProfile.fromJson(data);
    } on Exception catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }
}
