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
  );
}

class HeroTag {
  static section(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_section${recipe.recipeId}'
      : 'section${recipe.recipeId}';
  static image(Recipe recipe,
      {bool fromSearch = false, bool fromFavorites = false}) {
    if (fromSearch) return 'search_image${recipe.image}${recipe.recipeId}';
    if (fromFavorites) {
      return 'favorites_image${recipe.image}${recipe.recipeId}';
    }
    return 'image${recipe.image}${recipe.recipeId}';
  }

  static title(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_title${recipe.title}${recipe.recipeId}'
      : 'title${recipe.title}${recipe.recipeId}';
  static divider(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_divider${recipe.recipeId}'
      : 'divider${recipe.recipeId}';
  static minutes(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_minutes${recipe.preparationMinutes}${recipe.recipeId}'
      : 'minutes${recipe.preparationMinutes}${recipe.recipeId}';
  static servings(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_servings${recipe.servings}${recipe.recipeId}'
      : 'servings${recipe.servings}${recipe.recipeId}';
  static reviews(Recipe recipe, {bool fromSearch = false}) => fromSearch
      ? 'search_reviews${recipe.likes}${recipe.recipeId}'
      : 'reviews${recipe.likes}${recipe.recipeId}';
  static mainSearchField({bool fromSearch = false}) =>
      fromSearch ? 'search_mainSearchField' : 'mainSearchField';
}