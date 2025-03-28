import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // title with percentage completion
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Completed",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 11),
              ),
              Text(
                "70%",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 11),
              ),
            ],
          ),

          const SizedBox(height: 3),

          // percent indicator
          LinearPercentIndicator(
            animation: true,
            padding: EdgeInsets.zero,
            lineHeight: 2.5,
            animationDuration: 2500,
            percent: 0.8,
            progressColor: ColorStrings.primary,
          )
        ],
      ),
    );
  }
}

class RowTextItems extends StatelessWidget {
  const RowTextItems({
    super.key,
    required this.leftText,
    required this.rightText,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.black,
    this.spacing = 3,
  });

  final String leftText, rightText;
  final double fontSize, spacing;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color,
                  ),
            ),
            if (rightText != "")
              Text(
                rightText,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: color,
                    ),
              ),
          ],
        ),

        // spacing
        SizedBox(height: spacing),
      ],
    );
  }
}
