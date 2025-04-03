import 'package:e_learn/features/school_level_category_screen/school_level_and_classes_screen.dart';
import 'package:e_learn/features/school_level_category_screen/widgets/topic_introduction_container.dart';
import 'package:e_learn/features/topics_screen/notifier/topics_notifier.dart';
import 'package:e_learn/features/widgets/custom_title_button.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/constants/subjects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicDetailsScreen extends StatelessWidget {
  const TopicDetailsScreen({
    super.key,
    required this.topicTitle,
    this.showProgress = false,
  });

  final String topicTitle;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Consumer<TopicsNotifier>(
      builder: (context, topicsNotifier, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            topicTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          children: [
            // container
            TopicIntroductionContainer(
              topicTitle: topicTitle,
              items: items,
              showProgress: showProgress,
            ),

            const SizedBox(height: 15),

            // lectures
            SectionHeader(title: "Lectures: ", showActionButton: false),

            // weekly arrangements
            ListView.separated(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: weeks.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) => Column(
                children: [
                  // container with onTap feature
                  DecoratedContainerButtonWidget(
                    title: weeks[index],
                    onTap: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 25,
                    ),
                  ),

                  // container with info to be shown when tapped
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 15, 30, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: ColorStrings.secondary),
                        ),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: weeksItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, indexe) => InkWell(
                          hoverColor: ColorStrings.secondary,
                          // push me to the topics screen of a particular subject with title comprising of class and subject title
                          onTap: () {
                            //TODO:  pdf reader online with a download section
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomTileButton(
                              title: weeksItems[indexe],
                              paddingValue: 0,
                              containerHeight: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
