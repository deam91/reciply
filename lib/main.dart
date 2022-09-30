import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipes_repository.dart';
import 'package:recipe_app/ui/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  recipesRepository = RecipesRepository();
  await dotenv.load(fileName: "assets/env/.env.development");
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
