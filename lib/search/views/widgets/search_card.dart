import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    this.onShowModalBottomSheet,
    required this.controller,
    this.onFieldSubmitted,
    this.showFilterButton = true,
  }) : super(key: key);
  final Function()? onShowModalBottomSheet;
  final TextEditingController controller;
  final Function(BuildContext context)? onFieldSubmitted;
  final bool showFilterButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              iconColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.all(14),
                child: Image.asset(
                  'assets/search_icon.png',
                  fit: BoxFit.cover,
                  width: 14,
                  height: 14,
                ),
              ),
              hintText: 'Search recipe',
              hintStyle: const TextStyle(color: Colors.black26),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.3,
                  color: Colors.black26,
                ),
              ),
              //focusedBorder:
            ),
            onFieldSubmitted: (String value) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted!(context);
              }
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (showFilterButton)
          SizedBox(
            width: 45,
            height: 45,
            child: MaterialButton(
              elevation: 0,
              color: const Color(0xff129575),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              onPressed: onShowModalBottomSheet,
              child: const Icon(
                Icons.tune_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
