import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learn/features/home/widgets/home_lesson_section.dart';
import 'package:e_learn/features/widgets/advert_banner.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var
    List<String> categories = [
      'Nursery',
      'Primary',
      'O-Level',
      'A-Level',
      'Skill-Based Learning',
    ];

    List<String> bannerTitles = [
      "New vocabulary course is now available",
      "New physics topics have been added",
      "Last week marking schemes are available",
      "New mathematics topics were added",
    ];

    debugPrint("screen size ${MediaQuery.of(context).size}");

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          children: [
            // welcome container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                children: [
                  // profile wth notification icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // a mix of profile image and welcome text
                      Row(
                        children: [
                          // profile_image
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorStrings.primary,
                            ),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: CachedNetworkImageProvider(
                                "https://images.unsplash.com/photo-1660798027105-5da8ad164e27?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // name and a sub title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Welcome, Jason",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                color: Colors.transparent,
                                child: Text(
                                  "Upgrade your knowledge for the better future",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      // notification
                      InkWell(
                        onTap: () {},
                        hoverColor: ColorStrings.secondary,
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: ColorStrings.secondary, width: 2),
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
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // header => Categories
            SectionHeader(title: "Categories"),

            const SizedBox(height: 10),

            // categories
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              padding: EdgeInsets.zero,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 10),
                itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  hoverColor: ColorStrings.primary,
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorStrings.secondary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(categories[index]),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // banners
            AdvertBanner(bannerTitles: bannerTitles),

            const SizedBox(height: 20),

            // continue learning
            HomeLessonSection(sectionTitle: "Ongoing Lessons"),

            const SizedBox(height: 10),

            // recommended lessons
            HomeLessonSection(sectionTitle: "Recommended Lessons"),

            const SizedBox(height: 10),

            // popular lessons
            HomeLessonSection(sectionTitle: "Popular Lessons"),
          ],
        ),
      ),
    );
  }
}
