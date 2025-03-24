import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:e_learn/features/home/home_screen.dart';
import 'package:e_learn/features/learning/learning_screen.dart';
import 'package:e_learn/features/profile/profile_screen.dart';
import 'package:e_learn/features/search/search_screen.dart';
import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu_notifier.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // var
    final screens = [
      const HomeScreen(),
      const SearchScreen(),
      const LearningScreen(),
      const ProfileScreen(),
    ];

    // var state = ref.watch(bottomNavProvider);

    return Consumer<BottomNavigationNotifier>(
      builder: (context, bottomNavNotifier, child) {
        return PopScope(
          canPop: bottomNavNotifier.index == 0,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && bottomNavNotifier.index != 0) {
              bottomNavNotifier.setIndexPage(0);
            }
          },
          child: Scaffold(
            body: screens[bottomNavNotifier.index],

            // nav bar
            bottomNavigationBar: BottomBarDefault(
              iconSize: 26,
              titleStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
              top: 10,
              bottom: 10,
              items: [
                TabItem(
                  icon: Icons.home_outlined,
                  title: 'Home',
                ),
                TabItem(
                  icon: Icons.search_outlined,
                  title: 'Search',
                ),
                TabItem(
                  icon: Icons.lightbulb_outlined,
                  title: 'Learning',
                ),
                TabItem(
                  icon: Icons.person_pin_circle_outlined,
                  title: 'Profile',
                ),
              ],
              backgroundColor: Colors.white,
              color: ColorStrings.secondary,
              colorSelected: ColorStrings.primary,
              animated: false,
              indexSelected: bottomNavNotifier.index,
              onTap: (index) => bottomNavNotifier.setIndexPage(index),
            ),
          ),
        );
      },
    );
  }
}
