import 'package:flutter/material.dart';

// #2e5971
const backgroundColor = Color(0xff2e5971);
// #1a3955
const listTagItemColor = Color(0xff1a3955);
// tags
const List<String> tags = ['ENTREES', 'APPS', 'MEETS', 'VEGAN', 'SALADS'];

const List<Color> recipeColors = [Color(0xffed8b5b), Color(0xffaf7385)];

final whiteBottomGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [
    0.0,
    0.1,
    0.9,
    1.0,
  ],
  colors: [
    Colors.white,
    Colors.white.withOpacity(0.0),
    Colors.white.withOpacity(0.0),
    Colors.white,
  ],
);

final whiteTopGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.center,
  stops: const [
    0.8,
    1.0,
  ],
  colors: [
    Colors.white.withOpacity(0.0),
    Colors.white,
  ],
);

const bottomNavBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border_rounded),
    label: 'Favorites',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_rounded),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    label: 'Account',
  ),
];
