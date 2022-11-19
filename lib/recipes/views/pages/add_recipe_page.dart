import 'package:flutter/material.dart';
import 'package:recipe_app/recipes/views/widgets/media_content.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleMediaSectionAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    scaleMediaSectionAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCubic,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 600), () {
        animationController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Recipe',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xff129575),
        elevation: 0,
      ),
      body: Hero(
        tag: 'add_recipe',
        child: Material(
          color: const Color(0xff129575),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        FadeTransition(
                          opacity: scaleMediaSectionAnimation,
                          child: ScaleTransition(
                            alignment: Alignment.center,
                            scale: scaleMediaSectionAnimation,
                            child: const AspectRatio(
                              aspectRatio: 16 / 9,
                              child: MediaContent(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
