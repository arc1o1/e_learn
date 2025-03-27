import 'package:flutter/material.dart';

class CustomTileButton extends StatelessWidget {
  const CustomTileButton({
    super.key,
    required this.title,
    this.onTap,
    this.textColor,
    this.paddingValue = 15,
    this.containerHeight = 55,
  });

  final String title;
  final void Function()? onTap;
  final Color? textColor;
  final double paddingValue, containerHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        padding: EdgeInsets.symmetric(vertical: paddingValue),
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
