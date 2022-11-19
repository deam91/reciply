import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/views/widgets/dashboard/user_card.dart';

class TopSection extends ConsumerStatefulWidget {
  const TopSection({super.key});

  @override
  ConsumerState<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends ConsumerState<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(
          height: 20,
        ),
        UserCard(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
