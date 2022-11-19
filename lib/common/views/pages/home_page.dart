import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/navigation/routes/routes.gr.dart';
import 'package:recipe_app/common/views/widgets/bottom_navbar.dart';
import 'package:recipe_app/common/views/widgets/notched_rectangle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_recipe',
        shape: const CircleBorder(),
        mini: true,
        backgroundColor: const Color(0xff129575),
        onPressed: () {
          context.router.push(const AddRecipeRoute());
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomAppBar(
          color: Colors.white,
          shape: const WaterfallNotchedRectangle(),
          notchMargin: 4,
          elevation: 12,
          child: BottomNavBarWidget(
            backgroundColor: Colors.transparent,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            icons: const [
              'assets/bottom_bar/home.svg',
              'assets/bottom_bar/favorite.svg',
              'assets/bottom_bar/search_icon.svg',
              'assets/bottom_bar/profile.svg',
            ],
            iconSize: 22,
          ),
        );
      },
      routes: const [
        DashboardRoute(),
        FavoritesRoute(),
        SearchRoute(),
        ProfileRoute(),
      ],
    );
  }
}
