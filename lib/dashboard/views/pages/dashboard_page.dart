import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/top_section.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/new_recipes.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipes_container.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            /// Moved widgets to widgets
            /// to avoid rebuilds
            children: const [
              TopSection(),
              Expanded(flex: 2, child: RecipesContainer()),
              Expanded(flex: 1, child: NewRecipesContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
