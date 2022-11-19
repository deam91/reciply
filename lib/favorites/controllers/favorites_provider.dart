import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

import '../models/data_services/bookmark_service.dart';

final bookmarkControllerProvider =
    AsyncNotifierProvider<BookmarkService, List<Recipe>>(BookmarkService.new);
