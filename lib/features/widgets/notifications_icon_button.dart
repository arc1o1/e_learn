import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class NotificationsIconButton extends StatelessWidget {
  const NotificationsIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: ColorStrings.secondary,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorStrings.secondary, width: 2),
        ),
        child: Stack(
          children: [
            // notifications icon
            Icon(
              Icons.notifications,
              color: Colors.grey.shade500,
            ),

            // active icon
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.circle_rounded,
                size: 8,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
