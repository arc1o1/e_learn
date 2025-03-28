import 'package:e_learn/features/categories_screen/classes_screen.dart';
import 'package:e_learn/features/categories_screen/topic_details_screen.dart';
import 'package:e_learn/features/categories_screen/topics_screen.dart';
import 'package:e_learn/features/home/home_screen.dart';
import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    // bottom nav menu => entry navigation
    GoRoute(
      path: '/',
      builder: (context, state) => const BottomNavMenu(),
    ),

    // home screen => home
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    // list of classes  => classes
    GoRoute(
      path: '/classes/:classTitle',
      builder: (context, state) => ClassesScreen(
        schoolLevel: state.pathParameters['classTitle'].toString(),
      ),
    ),

    // list of topics => topics
    GoRoute(
      path: '/topics/:subjectTitle/:classTitle',
      builder: (context, state) => TopicsScreen(
        subjectTitle: state.pathParameters['subjectTitle'].toString(),
        classTitle: state.pathParameters['classTitle'].toString(),
      ),
    ),

    // topic detail screen => topic details
    GoRoute(
      path: '/topic-detail/:topicTitle',
      builder: (context, state) => TopicDetailsScreen(
        topicTitle: state.pathParameters['topicTitle'].toString(),
      ),
    ),
  ],
);

GoRouter get router => _router;
