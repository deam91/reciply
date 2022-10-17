import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';

class UserBrand extends StatelessWidget {
  const UserBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer(
        builder: (context, ref, child) {
          final fbUser = ref.watch(authControllerProvider).fbUser;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      foregroundImage: CachedNetworkImageProvider(
                        fbUser?.photoURL ?? '',
                      ),
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        'Recipes',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        '10M',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        '3432',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                fbUser?.displayName ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
