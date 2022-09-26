import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            color: Colors.white30,
            icon: const Icon(
              Icons.tune_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tags.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: listTagItemColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Text(
                      tags[index],
                      style: const TextStyle(
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
