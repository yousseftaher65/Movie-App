import 'package:flutter/material.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/ui/layouts/edit%20profile%20screen/edit_profile_screen.dart';
import 'package:movie_pojo/ui/layouts/home/home_screen.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding1.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding_screen.dart';
import 'package:movie_pojo/ui/layouts/splash%20screen/splash_screen.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case PageRouteName.testOnBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case PageRouteName.onBoarding1:
        return MaterialPageRoute(builder: (_) => const OnBoarding1());
      case PageRouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case PageRouteName.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
