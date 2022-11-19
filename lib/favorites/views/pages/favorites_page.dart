import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/search/views/widgets/recipe_search_list.dart';
import 'package:recipe_app/search/views/widgets/search_card.dart';
import 'package:recipe_app/favorites/controllers/favorites_provider.dart';
import 'package:recipe_app/favorites/views/widgets/favorites_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchCard(
              onFieldSubmitted: (context) {
                setState(() => searchText = searchController.text);
              },
              controller: searchController,
              showFilterButton: false,
            ),
            const Expanded(
              child: FavoritesList(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Saved recipes'),
      ),
    );
  }
}
