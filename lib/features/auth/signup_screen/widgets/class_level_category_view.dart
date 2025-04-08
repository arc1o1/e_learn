import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_learn/features/auth/signup_screen/signup_view_model.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/constants/subjects.dart';

class ClassLevelCategoryView extends StatelessWidget {
  const ClassLevelCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // provider instance
    final signupViewModel = context.watch<SignupViewModel>();

    return Column(
      children: [
        // scholar category
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Class Level",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15),
            ),
          ],
        ),

        SizedBox(height: 5),

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 5, bottom: 10, left: 20),
          itemCount: lessons["schools"]!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 30,
          ),
          itemBuilder: (_, index) => InkWell(
            hoverColor: ColorStrings.primary,
            borderRadius: BorderRadius.circular(10),
            onTap: () => signupViewModel.setClassLevel(
              classLevel: lessons["schools"]![index],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // circle button
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorStrings.primary,
                      ),
                    ),
                    child: Icon(
                      Icons.circle,
                      size: 14,
                      color: signupViewModel.classLevel ==
                              lessons["schools"]![index]
                          ? ColorStrings.primary
                          : Colors.white,
                    ),
                  ),

                  SizedBox(width: 10),

                  //  name
                  Text(
                    lessons["schools"]![index],
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
