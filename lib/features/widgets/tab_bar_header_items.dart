import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class TabBarHeaderItems extends StatelessWidget {
  const TabBarHeaderItems({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorStrings.secondary,
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: ColorStrings.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: Colors.white,
          tabs: tabs,
        ),
      ),
    );
  }
}
