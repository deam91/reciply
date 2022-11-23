import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';
import 'package:recipe_app/dashboard/models/data_sources/recipes_api_service.dart';

void main() {
  List<Recipe> mockRecipeList = [];
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late CollectionReference mockCollectionReference;

  setUpAll(() async {
    mockRecipeList = [
      Recipe()..tags = ['Asian'],
      Recipe()..tags = ['Asian'],
      Recipe()..tags = ['Indian'],
      Recipe()..tags = ['Indian'],
      Recipe()..tags = ['Italian'],
      Recipe()..tags = ['Italian'],
      Recipe()..tags = ['Chinese'],
      Recipe()..tags = ['Other'],
      Recipe()..tags = ['Other'],
      Recipe()..tags = ['Other'],
      Recipe()..tags = ['Other'],
    ];
  });

  setUp(() async {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    mockCollectionReference = fakeFirebaseFirestore.collection('recipes');
    // Add data to mock Firestore collection
    for (Recipe mockNote in mockRecipeList) {
      await mockCollectionReference.add(mockNote.toJson());
    }
  });

  test('getRecipes() returns 10 recipes', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList = await dataRepository.getRecipes();

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 10);
  });

  test('getRecipes() returns 2 asian recipes', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList =
        await dataRepository.getRecipes(tag: TagEnum.asian);

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 2);
  });

  test('getRecipes() returns 2 italian recipes', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList =
        await dataRepository.getRecipes(tag: TagEnum.italian);

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 2);
  });

  test('getRecipes() returns 2 indian recipes', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList =
        await dataRepository.getRecipes(tag: TagEnum.indian);

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 2);
  });

  test('getRecipes() returns 1 chinese recipe', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList =
        await dataRepository.getRecipes(tag: TagEnum.chinese);

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 1);
  });

  test('getRecipes() returns 4 other recipes', () async {
    final dataRepository = RecipeService(firestore: fakeFirebaseFirestore);
    // Get data
    final List<Recipe>? recipeList =
        await dataRepository.getRecipes(tag: TagEnum.other);

    // Assert that the actual data matches the expected data
    expect(recipeList?.length, 4);
  });
}
