import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/user_card.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/new/new_recipes.dart';
import 'package:recipe_app/dashboard/views/widgets/recipes/recipes_container/recipes_container.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shadowColor: Colors.black.withOpacity(.1),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: 90,
        title: const UserCard(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Expanded(flex: 2, child: RecipesContainer()),
            Expanded(flex: 1, child: NewRecipesContainer()),
          ],
        ),
      ),
    );
  }
}
