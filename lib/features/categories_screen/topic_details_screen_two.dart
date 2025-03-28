import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class TopicDetailsScreen extends StatelessWidget {
  const TopicDetailsScreen({super.key, required this.topicTitle});

  final String topicTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          topicTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          // container
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorStrings.secondary),
            ),
            child: Row(
              children: [
                // image
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://elitestore.co.tz/storage/uploads/images/8cbb7fd4d8d04ce9818fa3bba8b35791.jpeg",
                  ),
                ),

                const SizedBox(width: 10),

                // description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      "History Subject : Form One",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "What You Will Learn:",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),

                    const SizedBox(height: 5),

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: ListView.builder(
                    //     stream: null,
                    //     builder: (context, snapshot) {
                    //       return Text(
                    //         "What You Will Learn:",
                    //       );
                    //     }
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
