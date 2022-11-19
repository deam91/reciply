import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';
import 'package:recipe_app/common/views/widgets/search_not_found.dart';
import 'package:recipe_app/dashboard/models/constants.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/tags_list.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipes_list.dart';

import '../../../../controllers/recipes_providers.dart';

class RecipesContainer extends ConsumerStatefulWidget {
  const RecipesContainer({super.key});

  @override
  ConsumerState<RecipesContainer> createState() => _RecipesContainerState();
}

class _RecipesContainerState extends ConsumerState<RecipesContainer> {
  TagEnum selectedTag = TagEnum.all;

  @override
  void initState() {
    super.initState();
  }

  _selectTag(TagEnum tag) {
    setState(() {
      selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        TagsList(
          onSelectTag: _selectTag,
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ref.watch(getRecipesProvider(selectedTag)).when(
            data: (data) {
              if (data != null && data.isEmpty) {
                return const SearchNotFoundLottie();
              }
              return RecipesList(
                recipes: data ?? [],
              );
            },
            error: (err, stack) {
              return const LoadingWidget();
            },
            loading: () {
              return const Center(
                child: LoadingWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
