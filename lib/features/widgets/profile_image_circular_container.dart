import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class ProfileImageCircularContainer extends StatelessWidget {
  const ProfileImageCircularContainer(
      {super.key, this.radius = 22, this.imageUrl, this.showBorder = true});

  final double radius;
  final String? imageUrl;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: showBorder ? ColorStrings.primary : Colors.transparent,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: CachedNetworkImageProvider(
          imageUrl ??
              "https://images.unsplash.com/photo-1660798027105-5da8ad164e27?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
      ),
    );
  }
}
