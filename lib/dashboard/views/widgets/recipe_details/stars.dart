import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.likes, this.size = 20.0});
  final double likes;
  final double size;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Icon(
                Icons.star_rounded,
                size: size,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            FittedBox(
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  '$likes',
                  // style: TextStyle(fontSize: size),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
