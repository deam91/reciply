import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/models/data/api_service.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

import '../../controllers/recipes_providers.dart';

class RecipeService extends APIService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RecipeService();

  @override
  Future<List<Recipe>?> getRecipes({TagEnum? tag}) async {
    try {
      var query = _firestore.collection('recipes').limit(10);
      if (tag != TagEnum.all) {
        query = query.where('tags', arrayContains: tag?.value);
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
      var query = _firestore.collection('recipes').limit(10);

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
      var query = _firestore.collection('recipes').limit(10);

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
}
