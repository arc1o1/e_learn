import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBannerContainer extends StatelessWidget {
  const ImageBannerContainer({
    super.key,
    required this.bannerTitle,
    this.fontSize = 18,
    this.textContainerWidth = 0,
  });

  final String bannerTitle;
  final double fontSize, textContainerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        width: textContainerWidth == 0
            ? MediaQuery.of(context).size.width * 0.45
            : textContainerWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bannerTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: fontSize),
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
    );
  }
}
