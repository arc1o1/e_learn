import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LessonVerticalContainer extends StatelessWidget {
  const LessonVerticalContainer({
    super.key,
    this.showProgress = false,
    this.showContents = true,
  });

  final bool showProgress, showContents;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "https://media.istockphoto.com/id/1219382595/vector/math-equations-written-on-a-blackboard.jpg?s=1024x1024&w=is&k=20&c=FuAlO8n7UyfykyqpZMhWpQD66wIJuIbgXG7ZQPRgoPk=",
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          // lesson title and other details
          RowTextItems(
            leftText: "Mathematics: ",
            rightText: "Algebra",
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),

          RowTextItems(
            leftText: "A-Level",
            rightText: "3hrs Lesson",
          ),

          // if it is a home screen, show the contents of the lesson plan
          if (showContents)
            RowTextItems(
              leftText: "Notes + Weekly Tests",
              rightText: "",
              spacing: 6,
            ),

          // progress is not to be shown, show mw the price and rating
          if (!showProgress)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // price
                Text(
                  "2,000/= TZS",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: ColorStrings.primary,
                      ),
                ),

                // rating
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amberAccent,
                      size: 16,
                    ),
                    Text(
                      "4.5",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 14),
                    )
                  ],
                )
              ],
            ),

          // if we want to show progress of the lesson
          if (showProgress)
            Padding(
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
