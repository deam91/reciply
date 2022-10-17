import 'package:flutter/material.dart';

class LoadingHamburguerWidget extends StatelessWidget {
  const LoadingHamburguerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 250),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Center(
        child: Image.asset(
          'assets/searching.gif',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
