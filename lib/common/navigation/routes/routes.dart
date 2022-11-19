import 'package:auto_route/auto_route.dart';
import 'package:recipe_app/auth/views/pages/sign_up_page.dart';
import 'package:recipe_app/common/views/pages/startup_page.dart';
import 'package:recipe_app/dashboard/views/pages/dashboard_page.dart';
import 'package:recipe_app/favorites/views/pages/favorites_page.dart';
import 'package:recipe_app/recipes/views/pages/add_recipe_page.dart';
import 'package:recipe_app/search/views/pages/search_page.dart';
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
        AutoRoute(path: 'search', page: SearchPage),
        AutoRoute(path: 'profile', page: ProfilePage),
      ],
    ),
    AutoRoute(path: 'signUp', page: SignUpPage),
    CustomRoute(
      path: 'add_recipe',
      page: AddRecipePage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
// extend the generated private router
class $AppRouter {}
