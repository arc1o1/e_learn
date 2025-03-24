import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AdvertBanner extends StatelessWidget {
  const AdvertBanner({
    super.key,
    required this.bannerTitles,
    this.height = 150,
  });

  final List<String> bannerTitles;
  final double height;

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
          (index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "https://images.unsplash.com/photo-1513077202514-c511b41bd4c7?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
              ),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bannerTitles[index],
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 15),

                  // button
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: Text("Start Learning"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
