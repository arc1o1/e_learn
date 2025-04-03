import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopicCheckoutSummary extends StatelessWidget {
  const TopicCheckoutSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // image
          SizedBox(
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    "https://online.fliphtml5.com/rwbnv/ggld/files/large/1.webp?1608273509&1608273509",
              ),
            ),
          ),

          const SizedBox(width: 10),

          // topic detail
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // school level
              SummaryRichTextWidget(
                lTitle: "School Level :\t",
                rTitle: "O-Level - Form I",
              ),

              const SizedBox(height: 5),

              // subject
              SummaryRichTextWidget(
                lTitle: "Subject :\t",
                rTitle: "History",
              ),

              const SizedBox(height: 5),

              // topic
              SummaryRichTextWidget(
                lTitle: "Topic :\t",
                rTitle: "Introduction and Importance of History",
              ),

              const SizedBox(height: 5),

              // constituency
              SummaryRichTextWidget(
                lTitle: "Includes :\t",
                rTitle: "Notes, Weekly Test, Marking Scheme",
              ),

              const SizedBox(height: 5),

              // price
              SummaryRichTextWidget(
                lTitle: "Price :\t",
                rTitle: "3,000/= Tshs",
              ),

              const SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }
}

class SummaryRichTextWidget extends StatelessWidget {
  const SummaryRichTextWidget({
    super.key,
    required this.rTitle,
    required this.lTitle,
  });

  final String rTitle, lTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 145,
      color: Colors.transparent,
      child: RichText(
        maxLines: lTitle.contains('Includes') ? 2 : 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: lTitle,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            TextSpan(
              text: rTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
