import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/features/widgets/progress_indicator_widget.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class LessonVerticalContainer extends StatelessWidget {
  const LessonVerticalContainer({
    super.key,
    this.showProgress = false,
  });

  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      hoverColor: ColorStrings.secondary,
      onTap: () =>
          router.push('/topic-detail/Algebra I/${showProgress.toString()}'),
      child: Container(
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
            if (!showProgress)
              RowTextItems(
                leftText: "Notes + Weekly Tests",
                rightText: "",
                spacing: 6,
              ),

            // progress is not to be shown, show mw the price and rating
            !showProgress
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        "2,000/= TZS",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                  )
                : ProgressIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}
