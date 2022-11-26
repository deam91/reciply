import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

// #2e5971
const backgroundColor = Color(0xff2e5971);
// #1a3955
const listTagItemColor = Color(0xff1a3955);

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

final onboardingGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: const [
    0.0,
    1.0,
  ],
  colors: [
    Colors.black.withOpacity(.9),
    Colors.black.withOpacity(.5),
  ],
);

final imageGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: const [
    0.0,
    1.0,
  ],
  colors: [
    Colors.black.withOpacity(.8),
    Colors.transparent,
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

InputDecoration getInputDecoration({String placeholder = ''}) {
  return InputDecoration(
    hintText: placeholder,
    hintStyle: const TextStyle(
      color: Color(0xffD9D9D9),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    contentPadding: const EdgeInsets.all(15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    errorMaxLines: 0,
  );
}

class HeroTag {
  static String section(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_section${recipe.recipeId}'
      : 'section${recipe.recipeId}';
  static String image(Recipe recipe,
      {bool fromSearch = false,
      bool fromFavorites = false,
      bool fromDashboard = false,
      bool fromProfile = false}) {
    if (fromProfile) {
      return 'profile_image${recipe.recipeId}${recipe.ownerId}';
    }
    if (fromDashboard) {
      return 'dashboard_image${recipe.recipeId}${recipe.ownerId}';
    }
    if (fromSearch) {
      return 'search_image${recipe.recipeId}${recipe.ownerId}';
    }
    if (fromFavorites) {
      return 'favorites_image${recipe.recipeId}${recipe.ownerId}';
    }

    return 'image${recipe.recipeId}${recipe.ownerId}';
  }

  static String title(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_title${recipe.title}${recipe.recipeId}'
      : 'title${recipe.title}${recipe.recipeId}';
  static String divider(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_divider${recipe.recipeId}'
      : 'divider${recipe.recipeId}';
  static String minutes(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_minutes${recipe.readyInMinutes}${recipe.recipeId}'
      : 'minutes${recipe.readyInMinutes}${recipe.recipeId}';
  static String servings(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_servings${recipe.servings}${recipe.recipeId}'
      : 'servings${recipe.servings}${recipe.recipeId}';
  static String reviews(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_reviews${recipe.likes}${recipe.recipeId}'
      : 'reviews${recipe.likes}${recipe.recipeId}';
  static String mainSearchField({bool fromSearch = false}) =>
      fromSearch ? 'search_mainSearchField' : 'mainSearchField';
}
