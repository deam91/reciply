import 'package:auto_route/auto_route.dart';
import 'package:recipe_app/common/views/pages/startup_page.dart';
import 'package:recipe_app/dashboard/views/pages/dashboard_page.dart';
import 'package:recipe_app/favorites/favorites_page.dart';
import 'package:recipe_app/notifications/notifications_page.dart';
import 'package:recipe_app/profile/views/pages/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/start',
      page: StartupPage,
      initial: true,
      children: [
        AutoRoute(path: 'dashboard', page: DashboardPage, initial: true),
        AutoRoute(path: 'favorites', page: FavoritesPage),
        AutoRoute(path: 'notifications', page: NotificationsPage),
        AutoRoute(path: 'profile', page: ProfilePage),
      ],
    ),
  ],
)
// extend the generated private router
class $AppRouter {}
