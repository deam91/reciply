import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/favorites/models/data/user_bookmarks.dart';

class BookmarkService extends AsyncNotifier<List<Recipe>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> bookmarkIds = [];

  Future<List<dynamic>> getRecipes(List<String> bookmarks) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('userFavoriteRecipes');
    final results = await callable.call(<String, dynamic>{
      'bookmarks': bookmarks,
    });
    return results.data as List<dynamic>;
  }

  void registerBookmarksStream() async {
    final userId = ref.watch(authControllerProvider.notifier).fbUser?.uid;
    state = const AsyncLoading();
    _firestore
        .collection('user_bookmarks')
        .doc(userId)
        .snapshots()
        .listen((event) async {
      state = const AsyncLoading();
      final listData = (event.data()?['bookmarks'] ?? []) as List<dynamic>;
      bookmarkIds = listData.map((e) => e as String).toList();
      state = const AsyncLoading();
      final data = await getRecipes(bookmarkIds);
      final values = data.map((e) {
        final dataMap = Map<String, dynamic>.from(e);
        return Recipe.fromJson(dataMap, dataMap['id']);
      }).toList();
      state = AsyncData(values);
    });
  }

  Future<bool> saveBookmark(Recipe recipe) async {
    final userId = ref.read(authControllerProvider.notifier).fbUser?.uid;
    final bookmarkCollection = _firestore.collection('user_bookmarks');

    if (recipe.recipeId != null) {
      final bookmarkDoc = bookmarkCollection.doc(userId);
      final bookmarkSnapshot = await bookmarkDoc.get();
      if (bookmarkSnapshot.exists) {
        final data = bookmarkSnapshot.data() as Map<String, dynamic>;
        final bookmark = UserBookmarks.fromJson(data);
        if (bookmark.bookmarks == null) {
          await bookmarkCollection
              .doc(userId)
              .set(UserBookmarks([recipe.recipeId!]).toJson());
        } else if (!bookmark.bookmarks!.contains(recipe.recipeId!)) {
          bookmark.bookmarks?.add(recipe.recipeId!);
          await bookmarkDoc.set(bookmark.toJson());
        } else {
          bookmark.bookmarks?.remove(recipe.recipeId);
          await bookmarkCollection.doc(userId).update(bookmark.toJson());
        }
      } else {
        await bookmarkCollection
            .doc(userId)
            .set(UserBookmarks([recipe.recipeId!]).toJson());
      }
      return true;
    }
    return false;
  }

  @override
  List<Recipe> build() {
    registerBookmarksStream();
    return [];
  }
}
