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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../dashboard/views/pages/dashboard_page.dart' as _i2;
import '../../../favorites/favorites_page.dart' as _i3;
import '../../../notifications/notifications_page.dart' as _i4;
import '../../../profile/profile_page.dart' as _i5;
import '../../views/pages/startup_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FavoritesPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NotificationsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/start',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          StartupRoute.name,
          path: '/start',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: StartupRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: StartupRoute.name,
            ),
            _i6.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: StartupRoute.name,
            ),
            _i6.RouteConfig(
              NotificationsRoute.name,
              path: 'notifications',
              parent: StartupRoute.name,
            ),
            _i6.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: StartupRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.StartupPage]
class StartupRoute extends _i6.PageRouteInfo<void> {
  const StartupRoute({List<_i6.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          path: '/start',
          initialChildren: children,
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i4.NotificationsPage]
class NotificationsRoute extends _i6.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: 'notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}
