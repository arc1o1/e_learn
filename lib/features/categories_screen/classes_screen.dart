import 'package:e_learn/features/categories_screen/category_notifier.dart';
import 'package:e_learn/features/widgets/custom_title_button.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/constants/subjects.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key, required this.schoolLevel});

  final String schoolLevel;

  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolCategoryNotifier>(
      builder: (context, schoolCategoryNotifier, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            schoolLevel,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: ListView.separated(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: classes[schoolLevel]!.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => Column(
            children: [
              // container with onTap feature
              InkWell(
                onTap: () => schoolCategoryNotifier.selectClass(
                  // select the class particular in that school level
                  classSelected: classes[schoolLevel]![index],
                ),
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorStrings.secondary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        classes[schoolLevel]![index],
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 17),
                      ),

                      // icon

                      Icon(
                        schoolCategoryNotifier.selectedClass ==
                                classes[schoolLevel]![index]
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.arrow_forward_ios_rounded,
                        size: schoolCategoryNotifier.selectedClass ==
                                classes[schoolLevel]![index]
                            ? 25
                            : 15,
                      )
                    ],
                  ),
                ),
              ),

              // container with info to be shown when tapped
              Visibility(
                visible: schoolCategoryNotifier.selectedClass ==
                    classes[schoolLevel]![index],
                child: Padding(
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
                      itemCount: subjects[classes[schoolLevel]![index]]!.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, indexee) => InkWell(
                        hoverColor: ColorStrings.secondary,
                        // push me to the subject detail with title comprising of class and subject title
                        onTap: () => router.push(
                            '/subject-detail/${classes[schoolLevel]![index]} : ${subjects[classes[schoolLevel]![index]]![indexee]}'),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomTileButton(
                            title: subjects[classes[schoolLevel]![index]]![
                                indexee],
                            paddingValue: 0,
                            containerHeight: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
