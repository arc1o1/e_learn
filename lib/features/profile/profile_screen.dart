import 'package:e_learn/features/widgets/custom_title_button.dart';
import 'package:e_learn/features/widgets/profile_image_circular_container.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/services/routes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 15),
        //     child: InkWell(
        //       onTap: () {},
        //       borderRadius: BorderRadius.circular(100),
        //       child: Container(
        //         padding: EdgeInsets.all(5),
        //         child: Icon(Icons.menu_rounded),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
        shrinkWrap: true,
        children: [
          // profile image
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0x25412E81),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // profile image
                    ProfileImageCircularContainer(),

                    const SizedBox(width: 10),

                    // name and email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          "Jason Robert",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 17),
                        ),

                        // email
                        Text(
                          "jason.robert1@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),

                // // badge
                // Padding(
                //   padding: const EdgeInsets.only(right: 5),
                //   child: ProfileImageCircularContainer(
                //     radius: 15,
                //     showBorder: false,
                //     imageUrl:
                //         "https://image.similarpng.com/file/similarpng/very-thumbnail/2020/10/Golden-empty-badge-label-element-on-transparent-background-PNG.png",
                //   ),
                // )
              ],
            ),
          ),

          const SizedBox(height: 30),

          //summary
          CustomSummaryContainer(
            iconData: Icons.flag,
            title: "Lessons Completed",
            data: "11",
          ),

          const SizedBox(height: 10),

          CustomSummaryContainer(
            iconData: Icons.flash_on_rounded,
            title: "Days Streak",
            data: "4",
          ),

          const SizedBox(height: 20),

          // edit profile
          CustomTileButton(
            title: "Edit Profile",
            onTap: () => router.push('/edit-profile'),
          ),

          // notifications
          CustomTileButton(
            title: "Notifications",
            onTap: () => router.push('/notifications'),
          ),

          // payments
          CustomTileButton(
            title: "Payments",
            onTap: () => router.push('/payments'),
          ),

          // privacy
          CustomTileButton(
            title: "Privacy",
            onTap: () {},
          ),

          // about the app
          CustomTileButton(
            title: "About the app",
            onTap: () {},
          ),

          // logout
          CustomTileButton(
            title: "Log out",
            textColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomSummaryContainer extends StatelessWidget {
  const CustomSummaryContainer({
    super.key,
    required this.title,
    required this.data,
    required this.iconData,
  });

  final String title, data;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorStrings.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // icon
              Icon(iconData, color: ColorStrings.primary, size: 16),

              const SizedBox(width: 10),

              // title
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorStrings.primary, fontSize: 16),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              data,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
