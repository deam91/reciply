import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/models/user_profile.dart';
import 'package:recipe_app/common/models/data_sources/api_service.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/search/controllers/search.dart';

class RecipeService extends APIService {
  RecipeService({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<List<Recipe>?> getRecipes({TagEnum? tag}) async {
    try {
      var query = firestore.collection('recipes').limit(10);
      if (tag != null && tag != TagEnum.all) {
        query = query
            .where('tags', arrayContains: tag.value)
            .orderBy("createdAt", descending: true);
      }
      final snapshot = await query.get();
      final list = snapshot.docs.map((e) {
        return Recipe.fromJson(e.data(), e.id);
      });
      return list.toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Future<List<Recipe>?> searchRecipes(
      {SearchFilter? filters, String text = ''}) async {
    try {
      var query = firestore.collection('recipes').limit(10);

      if (text != '') {
        query = query
            .where("title", isGreaterThanOrEqualTo: text)
            .where("title", isLessThanOrEqualTo: "$text\uf7ff")
            .orderBy('title', descending: true);
      }

      if (filters != null) {
        final star = filters.star;
        if (star != null && text == '') {
          query = query
              .where('stars', isLessThanOrEqualTo: star.maxValue)
              .where('stars', isGreaterThanOrEqualTo: star.maxValue - 1)
              .orderBy('stars', descending: true);
        }
        final tag = filters.tag;
        if (tag != null && tag != TagEnum.all) {
          query = query.where('tags', arrayContains: tag.value);
        }
        final time = filters.time;
        if (time != null) {
          switch (time) {
            case (TimeEnum.newest):
              query = query.orderBy('createdAt', descending: true);
              break;
            case (TimeEnum.oldest):
              query = query.orderBy('createdAt');
              break;
            case (TimeEnum.popularity):
              query = query.orderBy('likes', descending: true);
              break;
            default:
              query = query.orderBy('likes');
              break;
          }
        }
      }

      final result = await query.get();
      final list = result.docs.map((e) {
        return Recipe.fromJson(e.data(), e.id);
      });
      return list.toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<Recipe>?> userRecipes({String? userId = ''}) async {
    try {
      var query = firestore.collection('recipes').limit(10);

      if (userId != '') {
        query = query
            .where("ownerId", isEqualTo: userId)
            .orderBy('createdAt', descending: true);
      }

      final result = await query.get();
      final list = result.docs.map((e) {
        return Recipe.fromJson(e.data(), e.id);
      });
      return list.toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<DocumentReference<Map<String, dynamic>>> saveRecipe({
    required Recipe recipe,
    required UserProfile? owner,
    required String? userId,
  }) async {
    recipe.ownerId = userId;
    recipe.owner = RecipeOwner()
      ..name = owner?.name
      ..image = owner?.photoUrl;
    return await FirebaseFirestore.instance
        .collection('recipes')
        .add(recipe.toJson());
  }
}
