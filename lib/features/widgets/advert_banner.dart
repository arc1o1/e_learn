import 'package:e_learn/features/widgets/image_banner_container.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AdvertBanner extends StatelessWidget {
  const AdvertBanner({
    super.key,
    required this.bannerTitles,
    this.height = 150,
    this.textContainerWidth = 0,
  });

  final List<String> bannerTitles;
  final double height, textContainerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 2),
      color: Colors.transparent,
      child: ImageSlideshow(
        indicatorColor: ColorStrings.primary,
        autoPlayInterval: 0,
        isLoop: true,
        indicatorBackgroundColor: Colors.white,
        initialPage: 0,
        onPageChanged: (page) {},
        children: List.generate(
          bannerTitles.length,
          (index) => ImageBannerContainer(
            bannerTitle: bannerTitles[index],
            textContainerWidth: textContainerWidth,
          ),
        ),
      ),
    );
  }
}
