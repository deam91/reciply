import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfileService {
  UserProfileService();

  Stream<DocumentSnapshot<Map<String, dynamic>>> userProfileStream(
      String? userUId) {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userUId)
          .snapshots();
    } on Exception catch (err) {
      debugPrint(err.toString());
    }
    return const Stream.empty();
  }

  followUser(String? userUId, String? followedUId) async {
    try {
      await FirebaseFirestore.instance
          .collection('followers')
          .doc(followedUId)
          .set(
        {'$userUId': true},
        SetOptions(merge: true),
      );
    } on Exception catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  Future<int> followers(String? userUID) async {
    return (await FirebaseFirestore.instance
            .collection('followers')
            .where('$userUID', isEqualTo: true)
            .count()
            .get())
        .count;
  }

  Future<int> recipesCount(String? userUID) async {
    return (await FirebaseFirestore.instance
            .collection('recipes')
            .where('ownerId', isEqualTo: '$userUID')
            .count()
            .get())
        .count;
  }
}
