import 'package:e_learn/features/categories_screen/classes_screen.dart';
import 'package:e_learn/utils/constants/subjects.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({
    super.key,
    required this.subjectTitle,
    required this.classTitle,
  });

  final String subjectTitle, classTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$classTitle : $subjectTitle',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: topics[subjectTitle] != null
          ? ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) => DecoratedContainerButtonWidget(
                title: topics[subjectTitle]![index],
                onTap: () => router.push(
                  '/topic-detail/${topics[subjectTitle]![index]}',
                ),
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
              ),
            )
          : Center(
              child: Text(
                "No topics are available",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
    );
  }
}
