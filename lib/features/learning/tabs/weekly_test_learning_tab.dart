import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class WeeklyTestLearningTab extends StatelessWidget {
  const WeeklyTestLearningTab({
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

            // test items
            Container(
              height: 213,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, index) => Column(
                  children: [
                    // container with a decoration image as a background
                    Container(
                      height: 193,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorStrings.secondary),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            "https://media.istockphoto.com/id/1370390878/vector/maths-symbols-icon-set-algebra-or-mathematics-subject-doodle-design-education-and-study.jpg?s=1024x1024&w=is&k=20&c=mdUDDvWx6aJ0N1exlcAvtPzisoozqHX5nhzJpT9JtQo=",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
