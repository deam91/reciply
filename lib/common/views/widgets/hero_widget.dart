import 'dart:math';

import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.tag, required this.child});
  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        final tween = Tween(
          begin: 0.001,
          end: 2,
        );
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        final rotationAnimation = tween.animate(curvedAnimation);

        return AnimatedBuilder(
          animation: rotationAnimation,
          child: child,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003)
                ..rotateZ(rotationAnimation.value * pi),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
