import 'package:flutter/material.dart';
import 'package:recipe_app/recipes/models/constants.dart';

class KeyValue {
  KeyValue(this.key, this.value);
  final String key;
  final String value;
}

List<KeyValue> list = <KeyValue>[
  KeyValue('None', ''),
  KeyValue('Grams', 'g'),
  KeyValue('Milligrams', 'mg'),
  KeyValue('Liters', 'L'),
  KeyValue('Milliliters', 'ml'),
  KeyValue('Ounces', 'ounces'),
  KeyValue('Cups', 'cups'),
  KeyValue('Tablespoons', 'tablespoons'),
  KeyValue('Handful', 'handful'),
  KeyValue('Cloves', 'cloves'),
  KeyValue('Pint', 'pint'),
  KeyValue('Pound', 'pound'),
  KeyValue('Servings', 'servings'),
];

class UnitsDropdown extends StatelessWidget {
  const UnitsDropdown({
    super.key,
    required this.keyName,
    required this.value,
    required this.onValueChanged,
  });
  final String keyName;
  final String value;
  final TextCallback onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: DropdownButtonFormField<String>(
        key: Key(keyName),
        value: value,
        items: list.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem<String>(
            value: e.value,
            child: Text(e.key),
          );
        }).toList(),
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        dropdownColor: const Color(0xff129575).withOpacity(.9),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.white),
          hoverColor: Colors.white,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.7),
            ),
            gapPadding: 0.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.3),
            ),
            gapPadding: 0.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onValueChanged,
      ),
    );
  }
}
