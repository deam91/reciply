import 'package:flutter/material.dart';
import 'package:recipe_app/profile/views/widgets/user_brand.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            highlightColor: Colors.white12,
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: UserBrand(),
          ),
        ],
      ),
    );
  }
}
