import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

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
        TextFormField(
          decoration: InputDecoration(
            iconColor: Colors.white,
            prefixIcon: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black45,
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
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
