import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.likes, this.size = 20.0});
  final int likes;
  final double size;

  List<Widget> _buildStarts() {
    return List.generate(
      5,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Icon(
          Icons.star,
          size: size,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._buildStarts(),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              child: Text(
                '$likes reviews',
                // style: TextStyle(fontSize: size),
              ),
            )
          ],
        ),
      ),
    );
  }
}
