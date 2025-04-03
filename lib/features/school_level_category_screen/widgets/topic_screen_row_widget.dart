import 'package:flutter/material.dart';

class TopicScreenDetailRowItem extends StatelessWidget {
  const TopicScreenDetailRowItem(
      {super.key,
      required this.titleLeft,
      required this.titleRight,
      this.isSpaceBetween = true,
      this.isCenter = false});

  final String titleLeft, titleRight;
  final bool isSpaceBetween, isCenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSpaceBetween
          ? MainAxisAlignment.spaceBetween
          : isCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        Text(
          titleLeft,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 17),
        ),

        const SizedBox(width: 5),

        // show if not null
        if (titleLeft != "")
          Text(
            titleRight,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 17),
          ),
      ],
    );
  }
}
