import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/models/utils.dart';
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
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_recipe',
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff129575),
        onPressed: () async {
          final result = await context.router.push(const AddRecipeRoute());
          if (result == 'saved' && mounted) {
            showSnackBarMessage(context, 'Recipe saved!');
          }
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomAppBar(
          color: Colors.white,
          shape: const WaterfallNotchedRectangle(),
          clipBehavior: Clip.none,
          notchMargin: 6,
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
