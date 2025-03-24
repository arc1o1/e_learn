import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.showActionButton = true,
    this.actionButtonTitle = "View All",
  });

  final String title, actionButtonTitle;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // title
        Text(
          title,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 19),
        ),

        // show all button
        if (showActionButton)
          InkWell(
            borderRadius: BorderRadius.circular(100),
            hoverColor: ColorStrings.primary,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                actionButtonTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 13, color: ColorStrings.primary),
              ),
            ),
          ),
      ],
    );
  }
}
