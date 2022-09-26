import 'package:flutter/material.dart';
import 'package:recipe_app/home_page.dart';

import 'core/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        iconTheme: const IconThemeData(color: Colors.white),
        canvasColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontSize: 20.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
