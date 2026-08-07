import 'package:flutter/material.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/registration_screen/registration_screen.dart';
import '../presentation/email_verification_screen/email_verification_screen.dart';
import '../presentation/account_ready_screen/account_ready_screen.dart';
import '../presentation/health_activity_dashboard_screen/health_activity_dashboard_screen.dart';
import '../presentation/group_health_tracker_screen/group_health_tracker_screen.dart';
import '../presentation/map_screen/map_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';
  static const String registrationScreen = '/registration_screen';
  static const String emailVerificationScreen = '/email_verification_screen';
  static const String accountReadyScreen = '/account_ready_screen';
  static const String healthActivityDashboardScreen =
      '/health_activity_dashboard_screen';
  static const String groupHealthTrackerScreen = '/group_health_tracker_screen';
  static const String mapScreen = '/map_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    onboardingScreen: (context) => OnboardingScreen(),
    registrationScreen: (context) => RegistrationScreen(),
    emailVerificationScreen: (context) => EmailVerificationScreen(),
    accountReadyScreen: (context) => AccountReadyScreen(),
    healthActivityDashboardScreen: (context) => HealthActivityDashboardScreen(),
    groupHealthTrackerScreen: (context) => GroupHealthTrackerScreen(),
    mapScreen: (context) => MapScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => AppNavigationScreen(),
  };
}
