import 'package:e_learn/features/learning/widgets/learning_tab_views.dart';
import 'package:e_learn/features/learning/widgets/tab_bar_items.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var
    List<String> subjects = ['Mathematics', 'Physics', 'Chemistry', 'Biology'];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Lessons",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              // tab bars
              ClipRRect(
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
                    tabs: const [
                      TabBarItems(title: 'Notes', count: 0),
                      TabBarItems(title: 'Weekly Tests', count: 0),
                      TabBarItems(title: 'Exams', count: 0),
                    ],
                  ),
                ),
              ),

              // tab bar views
              Expanded(
                child: TabBarView(
                  children: [
                    // Notes
                    NotesLearningTab(subjects: subjects),

                    // Weekkly Tests
                    WeeklTestLearningTab(subjects: subjects),

                    // Exams
                    ExamsLearningTab(subjects: subjects),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
