import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 0,
      indicatorPadding:
          const EdgeInsets.symmetric(horizontal: -12, vertical: 0),
      indicator: BoxDecoration(
        color: const Color(0xff129575),
        borderRadius: BorderRadius.circular(14),
      ),
      physics: const NeverScrollableScrollPhysics(),
      indicatorColor: const Color(0xff129575),
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.black45,
      isScrollable: true,
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
      automaticIndicatorColorAdjustment: true,
      tabs: const <Tab>[
        Tab(
          text: 'Ingredients',
          height: 40,
        ),
        Tab(
          text: 'Directions',
          height: 40,
        ),
      ],
      controller: tabController,
    );
  }
}
