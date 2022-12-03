import 'package:flutter/material.dart';
import 'package:recipe_app/dashboard/models/constants.dart';

class TagsList extends StatefulWidget {
  const TagsList({super.key, required this.onSelectTag});
  final Function(TagEnum tag) onSelectTag;

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  int selectedItem = 0;
  final double itemExtent = 80;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        controller: scrollController,
        shrinkWrap: true,
        itemCount: TagEnum.values.length,
        itemExtent: itemExtent,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedItem = index;
                scrollController.animateTo(
                  index * itemExtent,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
                widget.onSelectTag(TagEnum.values[index]);
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: index == selectedItem
                    ? const Color(0xff129575)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              duration: const Duration(milliseconds: 150),
              child: Center(
                child: Text(
                  TagEnum.values[index].value,
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedItem != index
                        ? const Color(0xff129575)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
