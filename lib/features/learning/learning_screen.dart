import 'package:e_learn/features/learning/tabs/exams_learning_tab.dart';
import 'package:e_learn/features/learning/tabs/notes_learning_tab.dart';
import 'package:e_learn/features/learning/tabs/weekly_test_learning_tab.dart';
import 'package:e_learn/features/learning/widgets/tab_bar_items.dart';
import 'package:e_learn/features/widgets/tab_bar_header_items.dart';
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
              TabBarHeaderItems(
                tabs: const [
                  TabBarItems(title: 'Notes', count: 0),
                  TabBarItems(title: 'Weekly Tests', count: 0),
                  TabBarItems(title: 'Exams', count: 0),
                ],
              ),

              // tab bar views
              Expanded(
                child: TabBarView(
                  children: [
                    // Notes
                    NotesLearningTab(subjects: subjects),

                    // Weekkly Tests
                    WeeklyTestLearningTab(subjects: subjects),

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
