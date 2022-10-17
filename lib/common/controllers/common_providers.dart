import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/models/data/local_cache_service.dart';
import 'package:recipe_app/common/models/data/notification_service.dart';

final cacheProvider = StateProvider<LocalCacheService>((ref) {
  return LocalCacheService();
});

final notificationProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
