import 'package:e_learn/features/widgets/lesson_vertical_container.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:flutter/material.dart';

class NotesLearningTab extends StatelessWidget {
  const NotesLearningTab({
    super.key,
    required this.subjects,
  });

  final List<String> subjects;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: subjects.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, index) => Column(
                children: [
                  // lesson subject
                  SectionHeader(title: subjects[index]),

                  // vertical lesson listview
                  Container(
                    height: 213,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, index) => LessonVerticalContainer(
                        showProgress: true,
                        showContents: false,
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
