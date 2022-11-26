import 'package:flutter/material.dart';

class MultiSelectTags extends StatefulWidget {
  const MultiSelectTags(
      {super.key, required this.tagList, required this.onSelectionChanged});
  final List<String> tagList;
  final Function(List<String>) onSelectionChanged;

  @override
  MultiSelectTagsState createState() => MultiSelectTagsState();
}

class MultiSelectTagsState extends State<MultiSelectTags> {
  bool isSelected = false;
  List<String> selectedTags = <String>[];

  List<Container> _buildChoiceList() {
    return widget.tagList.map((item) {
      final selected = selectedTags.contains(item);
      return Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: const Color(0xff129575).withOpacity(.8),
          backgroundColor: const Color(0xff129575),
          labelPadding: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          labelStyle: const TextStyle(color: Colors.white),
          side: selected
              ? null
              : BorderSide(
                  color: Colors.white.withOpacity(.1),
                ),
          label: Text(item),
          shape: const StadiumBorder(),
          selected: selected,
          onSelected: (_) {
            setState(() {
              selectedTags.contains(item)
                  ? selectedTags.remove(item)
                  : selectedTags.add(item);
            });
            widget.onSelectionChanged(selectedTags);
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Recipe Tags',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: _buildChoiceList(),
        ),
      ],
    );
  }
}
