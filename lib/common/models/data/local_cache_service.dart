import 'package:isar/isar.dart';
import 'package:recipe_app/common/models/user_settings.dart';

class LocalCacheService {
  late final Isar isar;
  LocalCacheService() {
    _connect();
  }

  _connect() async {
    print('connecting isar...');
    final isarDb = await Isar.open([UserSettingsSchema]);
    isar = isarDb;
    print('Isar db initialized...');
  }

  // Future<int> _saveRecipeBookmark(Recipe e) async {
  //   final data = RecipeBookmark.fromJson(e.toJson());
  //   return await isar.writeTxn(
  //     () => isar.recipeBookmarks.put(data),
  //   );
  // }
  //
  // _removeRecipeBookmark(Recipe e) async {
  //   return await isar.writeTxn(
  //     () => isar.recipeBookmarks.delete(e.id ?? 0),
  //   );
  // }
  //
  // Future<void> saveBookmark(Recipe recipe) async {
  //   await _saveRecipeBookmark(recipe);
  // }
  //
  // Future<bool> removeBookmark(Recipe recipe) async {
  //   return await _removeRecipeBookmark(recipe);
  // }

  bool isOnboarded() {
    if (!isar.isOpen) {
      _connect();
    }
    final settings = isar.userSettings.where(distinct: true).findFirstSync();
    return settings?.isOnboarded ?? false;
  }

  Future<bool> setOnboarded(bool isOnboarded) async {
    final settings = isar.userSettings.where().findFirstSync();
    UserSettings newSettings;
    if (settings != null) {
      newSettings = settings..isOnboarded = isOnboarded;
    } else {
      newSettings = UserSettings()..isOnboarded = isOnboarded;
    }
    await isar.writeTxn(() async {
      await isar.userSettings.put(newSettings); // insert & update
    });

    return settings?.isOnboarded ?? false;
  }
}
