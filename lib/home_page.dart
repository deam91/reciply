import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants.dart';
import 'package:recipe_app/data/recipes_service.dart';
import 'package:recipe_app/models/recipe/recipe.dart';
import 'package:recipe_app/ui/widgets/bottom_section.dart';
import 'package:recipe_app/core/widgets/loading.dart';
import 'package:recipe_app/ui/widgets/recipes/recipes_container.dart';
import 'package:recipe_app/ui/widgets/recipes/recipes_list.dart';
import 'package:recipe_app/ui/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: Colors.white10,
          alignment: Alignment.center,
          color: Colors.white,
          onPressed: () {},
          icon: const Icon(
            Icons.sort_rounded,
            size: 24,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: [
          SizedBox(
            width: 55,
            height: 50,
            child: IconButton(
              enableFeedback: true,
              splashRadius: 5,
              splashColor: Colors.white10,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        // height: 88,
        child: BottomNavigationBar(
          iconSize: 22,
          selectedIconTheme: const IconThemeData(color: Colors.white, size: 22),
          unselectedIconTheme:
              const IconThemeData(color: Colors.white38, size: 22),
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          mouseCursor: SystemMouseCursors.click,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: '',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          /// Moved widgets to widgets
          /// to avoid rebuilds
          children: const [
            TopSection(),
            Expanded(child: RecipesContainer()),
            SizedBox(
              height: 15,
            ),
            BottomSection(),
          ],
        ),
      ),
    );
  }
}
