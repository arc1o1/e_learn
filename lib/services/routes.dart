import 'package:e_learn/services/dio_service_locator.dart';
import 'package:e_learn/services/token_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:e_learn/features/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:e_learn/features/auth/signin_screen/signin_screen.dart';
import 'package:e_learn/features/auth/signup_screen/signup_screen.dart';
import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu.dart';
import 'package:e_learn/features/home/home_screen.dart';
import 'package:e_learn/features/notifications/notifications_screen.dart';
import 'package:e_learn/features/payments/payment_checkout_screen.dart';
import 'package:e_learn/features/payments/payments_screen.dart';
import 'package:e_learn/features/profile/edit_profile_screen.dart';
import 'package:e_learn/features/school_level_category_screen/school_level_and_classes_screen.dart';
import 'package:e_learn/features/topics_screen/topic_details_screen.dart';
import 'package:e_learn/features/topics_screen/topics_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool isLoggedIn() {
  final token = locator<TokenService>().getAccessTokenSync();
  return token != null && token.isNotEmpty;
}

bool isRefreshTokenValid() {
  return locator<TokenService>().isRefreshTokenValid();
}

// =============================================================================

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/sign-in',
  redirect: (context, state) {
    final loggedIn = isLoggedIn();
    final refreshTokenValid = isRefreshTokenValid();

    // if not authenticated
    if (!loggedIn && !refreshTokenValid) {
      return '/sign-in';
    }

    // if authenticated
    if (loggedIn && refreshTokenValid) {
      return '/';
    }

    // do not redirect
    return null;
  },
  routes: [
    // signin
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SigninScreen(),
    ),

    // signup
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignupScreen(),
    ),

    // forgot password
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

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
    // employ extra to pass map var
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
      path: '/topic-detail/:topicTitle/:showProgress',
      builder: (context, state) => TopicDetailsScreen(
        topicTitle: state.pathParameters['topicTitle'].toString(),
        showProgress:
            state.pathParameters['showProgress'] == 'true' ? true : false,
      ),
    ),

    // notifications screen
    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationsScreen(),
    ),

    // edit profile screen
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => EditProfileScreen(),
    ),

    // payments screen
    GoRoute(
      path: '/payment-checkout',
      builder: (context, state) => PaymentCheckoutScreen(),
    ),

    // payments screen
    GoRoute(
      path: '/payments',
      builder: (context, state) => PaymentsScreen(),
    ),
  ],
);

GoRouter get router => _router;
