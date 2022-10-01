import 'package:flutter/material.dart';
import 'package:recipe_app/core/hero_tag.dart';
import 'package:recipe_app/core/widgets/hero_widget.dart';
import 'package:recipe_app/ui/pages/recipes_search_results_page.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  final TextEditingController controller = TextEditingController();

  _goToSearchPage(String value) {
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
              search: value,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'Hi, Connor',
          style: TextStyle(
            color: Colors.brown[100],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'What do you want to cook today?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        HeroWidget(
          tag: HeroTag.mainSearchField(),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              iconColor: Colors.white,
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: Colors.black45,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.send_rounded,
                  size: 20,
                  color: Colors.black45,
                ),
                onPressed: () {
                  print('search.. ${controller.text}');
                  _goToSearchPage(controller.text);
                },
              ),
              hintText: 'Search recipes',
              hintStyle: const TextStyle(color: Colors.black45),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              //focusedBorder:
            ),
            onFieldSubmitted: (String value) {
              print('onSubmit..$value');
              _goToSearchPage(value);
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
