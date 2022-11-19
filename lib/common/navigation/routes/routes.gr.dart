// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../../auth/views/pages/sign_up_page.dart' as _i2;
import '../../../dashboard/views/pages/dashboard_page.dart' as _i4;
import '../../../favorites/views/pages/favorites_page.dart' as _i5;
import '../../../profile/views/pages/profile_page.dart' as _i7;
import '../../../recipes/views/pages/add_recipe_page.dart' as _i3;
import '../../../search/views/pages/search_page.dart' as _i6;
import '../../views/pages/startup_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    AddRecipeRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.AddRecipePage(),
        transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FavoritesPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SearchPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/start',
          fullMatch: true,
        ),
        _i8.RouteConfig(
          StartupRoute.name,
          path: '/start',
          children: [
            _i8.RouteConfig(
              '#redirect',
              path: '',
              parent: StartupRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i8.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: StartupRoute.name,
            ),
            _i8.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: StartupRoute.name,
            ),
            _i8.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: StartupRoute.name,
            ),
            _i8.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: StartupRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          SignUpRoute.name,
          path: 'signUp',
        ),
        _i8.RouteConfig(
          AddRecipeRoute.name,
          path: 'add_recipe',
        ),
      ];
}

/// generated route for
/// [_i1.StartupPage]
class StartupRoute extends _i8.PageRouteInfo<void> {
  const StartupRoute({List<_i8.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          path: '/start',
          initialChildren: children,
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.AddRecipePage]
class AddRecipeRoute extends _i8.PageRouteInfo<void> {
  const AddRecipeRoute()
      : super(
          AddRecipeRoute.name,
          path: 'add_recipe',
        );

  static const String name = 'AddRecipeRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.FavoritesPage]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}
