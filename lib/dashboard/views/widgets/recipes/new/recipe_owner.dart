import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/data/recipe.dart';

class RecipeOwnerWidget extends StatelessWidget {
  const RecipeOwnerWidget({super.key, required this.recipe, this.textColor});
  final Recipe recipe;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: recipe.owner?.image ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Image.asset('assets/images/logo_white.png'),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              recipe.owner?.name ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor ?? const Color(0xffA9A9A9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
