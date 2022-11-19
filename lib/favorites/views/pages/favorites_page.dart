import 'package:flutter/material.dart';
import 'package:recipe_app/search/views/widgets/search_card.dart';
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
        surfaceTintColor: Colors.white,
        title: const Text('Saved recipes'),
      ),
    );
  }
}
