import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/features/widgets/lesson_vertical_container.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
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

class WeeklTestLearningTab extends StatelessWidget {
  const WeeklTestLearningTab({
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

                    // const SizedBox(height: 5),

                    // name of the topic
                    // SizedBox(
                    //   width: 110,
                    //   child: Center(
                    //     child: Text(
                    //       "Algebra",
                    //       maxLines: 1,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headlineSmall!
                    //           .copyWith(fontSize: 16),
                    //     ),
                    //   ),
                    // )
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

class ExamsLearningTab extends StatelessWidget {
  const ExamsLearningTab({
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
              height: 215,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 9),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, index) => Stack(
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

                    // name of the topic
                    Positioned(
                      bottom: 5,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border.all(color: ColorStrings.secondary),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Mock 2025",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    )
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
