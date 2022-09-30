import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/api_service.dart';
import 'package:recipe_app/data/models/models.dart';
import 'package:recipe_app/data/network/endpoints.dart';

class RecipesAPIService extends APIService {
  RecipesAPIService() : super(BaseUrls.baseUrl);

  @override
  Future<List<Recipe>?> getRecipes({Map<String, String>? queryParams}) async {
    final apiKey = dotenv.env['SPOONACULAR_KEY'];
    if (queryParams != null) {
      queryParams['apiKey'] = apiKey!;
    } else {
      queryParams = {'apiKey': apiKey!};
    }
    try {
      var url = Uri.https(BaseUrls.baseUrl, BaseUrls.random, queryParams);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        final list = (data['recipes'] as List<dynamic>).map((e) {
          return Recipe.fromJson(e as Map<String, dynamic>);
        });
        return list.toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
