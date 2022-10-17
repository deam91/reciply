import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/common/models/data/api_service.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

import '../../controllers/recipes_providers.dart';

class RecipeService extends APIService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RecipeService();

  @override
  Future<List<Recipe>?> getRecipes({TagEnum? tag}) async {
    // final apiKey = dotenv.env['SPOONACULAR_KEY'];
    // if (queryParams != null) {
    //   queryParams['apiKey'] = apiKey!;
    // } else {
    //   queryParams = {'apiKey': apiKey!};
    // }
    try {
      print('getting data...');
      var query = _firestore.collection('recipes').limit(10);
      if (tag != TagEnum.all) {
        query = query.where('tags', arrayContains: tag?.value);
      }
      final snapshot = await query.get();
      print('Size ${snapshot.size}');
      final list = snapshot.docs.map((e) {
        print('created at: ${e.data()['createdAt']}');
        return Recipe.fromJson(e.data(), e.id);
      });
      return list.toList();
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  @override
  Future<List<Recipe>?> searchRecipes(
      {SearchFilter? filters, String text = ''}) async {
    try {
      var query = _firestore.collection('recipes').limit(10);

      if (text != '') {
        print('where text: $text');
        query = query
            .where("title", isGreaterThanOrEqualTo: text)
            .where("title", isLessThanOrEqualTo: "$text\uf7ff")
            .orderBy('title', descending: true);
      }

      if (filters != null) {
        final star = filters.star;
        if (star != null && text == '') {
          print('where star: ${star.value}');
          query = query
              .where('stars', isLessThanOrEqualTo: star.maxValue)
              .where('stars', isGreaterThanOrEqualTo: star.maxValue - 1)
              .orderBy('stars', descending: true);
        }
        final tag = filters.tag;
        if (tag != null && tag != TagEnum.all) {
          print('where tag: ${tag.value}');
          query = query.where('tags', arrayContains: tag.value);
        }
        final time = filters.time;
        if (time != null) {
          print('where time: ${time.value}');
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

      print('Getting results...');
      final result = await query.get();
      print('Result count: ${result.size}');
      final list = result.docs.map((e) {
        return Recipe.fromJson(e.data(), e.id);
      });
      return list.toList();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
