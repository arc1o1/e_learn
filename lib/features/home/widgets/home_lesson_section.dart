import 'package:e_learn/features/widgets/lesson_vertical_container.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeLessonSection extends StatelessWidget {
  const HomeLessonSection({
    super.key,
    required this.sectionTitle,
    this.showProgress = false,
  });

  final String sectionTitle;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: sectionTitle),

        // horizontal list view of items
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) => LessonVerticalContainer(
              showProgress: showProgress,
            ),
          ),
        ),
      ],
    );
  }
}
