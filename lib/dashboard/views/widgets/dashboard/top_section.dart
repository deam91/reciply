import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/controllers/recipes_providers.dart';
import 'package:recipe_app/dashboard/views/pages/recipes_search_results_page.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/filters_modal.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/user_card.dart';
import 'package:recipe_app/dashboard/views/widgets/search_card.dart';

class TopSection extends ConsumerStatefulWidget {
  const TopSection({super.key});

  @override
  ConsumerState<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends ConsumerState<TopSection> {
  final TextEditingController controller = TextEditingController();

  _showFiltersModalBottomSheet(BuildContext context) async {
    final filter = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const FilterModal();
      },
    );
    if (filter != null) {
      print('filter object: ${filter.toString()}');
      ref.read(searchFilters.notifier).state =
          (filter as SearchFilter?) ?? SearchFilter();
      return true;
    }
    return false;
  }

  _goToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: RecipeSearchResultsPage(
              controller: controller,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        const UserCard(),
        const SizedBox(
          height: 40,
        ),
        SearchCard(
          onShowModalBottomSheet: () async {
            final shouldNavigate = await _showFiltersModalBottomSheet(context);
            if (mounted && shouldNavigate) {
              _goToSearchPage(context);
            }
          },
          controller: controller,
          onFieldSubmitted: _goToSearchPage,
        ),
      ],
    );
  }
}
