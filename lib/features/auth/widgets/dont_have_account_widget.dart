import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget(
      {super.key, required this.title, this.onTap, this.isSigninPage = true});

  final String title;
  final void Function()? onTap;
  final bool isSigninPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSigninPage ? "Don't have an account? " : "Already have an account",
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          hoverColor: ColorStrings.secondary,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16, color: ColorStrings.primary),
            ),
          ),
        ),
      ],
    );
  }
}
