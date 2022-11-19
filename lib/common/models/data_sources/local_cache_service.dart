import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalCacheService {
  Box? preferencesBox;

  Future<void> init() async {
    debugPrint('Initializing hive...');
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    debugPrint("[Hive] Done");
    // preferencesBox = await Hive.openBox('userPreferences');
  }

  Future<bool> isOnboarded() async {
    preferencesBox ??= await Hive.openBox('userPreferences');
    final isOnboarded = preferencesBox!.get('isOnboarded');
    return isOnboarded ?? false;
  }

  Future<bool> setOnboarded(bool isOnboarded) async {
    preferencesBox!.put('isOnboarded', isOnboarded);
    return isOnboarded;
  }
}
