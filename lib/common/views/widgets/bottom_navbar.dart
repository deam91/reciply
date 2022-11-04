import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.backgroundColor,
    required this.iconSize,
    required this.icons,
  });
  final Function(int index) onTap;
  final int currentIndex;
  final Color backgroundColor;
  final double iconSize;
  final List<String> icons;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        ...List.generate(widget.icons.length, (index) {
          final color = widget.currentIndex == index
              ? const Color(0xff129575)
              : Colors.black26;
          final iconAsset = widget.icons[index];
          final icon = SvgPicture.asset(
            iconAsset,
            height: 20,
            color: color,
          );
          final scale = widget.currentIndex == index ? 1.1 : 1.0;

          return AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 200),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: MaterialButton(
                key: Key('$index${color.toString()}'),
                onPressed: () {
                  widget.onTap(index);
                },
                shape: const CircleBorder(),
                child: icon,
              ),
            ),
          );
        }),
        const SizedBox(
          width: 55,
        ),
      ],
    );
  }
}
