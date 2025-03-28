import 'package:e_learn/features/categories_screen/widgets/topic_screen_row_widget.dart';
import 'package:e_learn/features/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class TopicDetailsScreen extends StatelessWidget {
  const TopicDetailsScreen({super.key, required this.topicTitle});

  final String topicTitle;

  @override
  Widget build(BuildContext context) {
    // var
    final items = ['Notes', 'Weekly Tests', 'Practicals'];

    return Scaffold(
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
          Container(
            // height: 190,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                // class and subject
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "History : Form One",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // topic

                TopicScreenDetailRowItem(
                  titleLeft: "Topic: ",
                  titleRight: "       $topicTitle",
                  isSpaceBetween: false,
                ),

                const SizedBox(height: 15),

                // summary
                Row(
                  children: [
                    Text(
                      'Summary: ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),

                    // space between
                    const SizedBox(width: 3),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.66,
                      color: Colors.transparent,
                      child: Text(
                        "Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 11),

                // key points
                Row(
                  children: [
                    Text(
                      'What to expect: ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),

                    const SizedBox(width: 3),

                    // points
                    Wrap(
                      spacing: 4,
                      runSpacing: 3,
                      children: items
                          .map(
                            (topSearch) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                border: Border.all(color: Colors.black45),
                              ),
                              child: Text(
                                topSearch,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),

                const SizedBox(height: 3),

                // if enrolled show progress indicator
                ProgressIndicatorWidget(),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // buy topic button
          SizedBox(
            height: 35,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              child: Text(
                "Buy Topic, 2,000/= Tshs",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            ),
          ),

          const SizedBox(height: 5),

          // text widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "30-Day Money-Back Guarantee Full Lifetime Access",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
