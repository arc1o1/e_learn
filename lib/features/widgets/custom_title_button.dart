import 'package:flutter/material.dart';

class CustomTileButton extends StatelessWidget {
  const CustomTileButton({
    super.key,
    required this.title,
    this.onTap,
    this.textColor,
  });

  final String title;
  final void Function()? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // category name
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.black),
            ),

            // icon
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
