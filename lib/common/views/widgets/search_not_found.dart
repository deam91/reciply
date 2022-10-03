import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchNotFoundLottie extends StatelessWidget {
  const SearchNotFoundLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/search_not_found.json',
        repeat: true,
        reverse: true,
      ),
    );
  }
}
