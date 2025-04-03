import 'package:e_learn/features/widgets/buy_topic_button_widget.dart';
import 'package:e_learn/features/widgets/progress_indicator_widget.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:flutter/material.dart';

class TopicIntroductionContainer extends StatelessWidget {
  const TopicIntroductionContainer({
    super.key,
    required this.topicTitle,
    required this.items,
    this.showProgress = false,
  });

  final String topicTitle;
  final List<String> items;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // summary
        SectionHeader(title: "Summary: ", showActionButton: false),

        // space between
        const SizedBox(height: 10),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "This chapter tackles the significance of history as a discipline. It traces the different definitions of history, the importance of studying history as a subject as well as the different ways by which information that constitutes history is obtained",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ),

        const SizedBox(height: 20),

        // show buy topic button else show progress
        !showProgress
            ? BuyTopicButtonWidget()
            : Column(
                children: [
                  SectionHeader(title: "Progress: ", showActionButton: false),
                  ProgressIndicatorWidget(),
                  const SizedBox(height: 20),
                ],
              ),
      ],
    );
  }
}
