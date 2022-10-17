import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/common/navigation/routes/routes.gr.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: const Color(0xff129575),
      //   child: Icon(Icons.add),
      //   shape: CircleBorder(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          iconSize: 22,
          selectedIconTheme:
              const IconThemeData(color: Color(0xff129575), size: 22),
          unselectedIconTheme:
              const IconThemeData(color: Colors.black26, size: 22),
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          mouseCursor: SystemMouseCursors.click,
          unselectedItemColor: Colors.black26,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        );
      },
      routes: const [
        DashboardRoute(),
        FavoritesRoute(),
        NotificationsRoute(),
        ProfileRoute(),
      ],
    );
  }
}
