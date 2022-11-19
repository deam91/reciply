import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/controllers/common_providers.dart';
import 'package:recipe_app/common/navigation/observers/observer.dart';
import 'package:recipe_app/common/navigation/routes/routes.gr.dart';
import 'package:recipe_app/firebase_options.dart';

import 'common/views/widgets/constants.dart';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  // iOS configuration
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  // Android configuration
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification?.title ?? '',
    notification?.body ?? '',
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        icon: android?.smallIcon,
        // other properties...
      ),
    ),
  );
}

Future main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: "assets/env/.env.development");
      await Firebase.initializeApp(
        name: 'Reciply',
        options: DefaultFirebaseOptions.currentPlatform,
      );
      // Pass all errors to Crashlytics
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

      final container = ProviderContainer();
      await container.read(cacheProvider).init();
      container.read(notificationProvider).init();
      container.read(authControllerProvider);

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: MyApp(),
        ),
      );
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff129575),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(315, 60),
            maximumSize: const Size(315, 60),
          ),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontSize: 20.0, fontFamily: 'Hind', color: Colors.black),
          headline6: TextStyle(
            color: Colors.black,
          ),
          headline1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [RoutesObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
