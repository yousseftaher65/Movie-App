import 'package:flutter/material.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/ui/layouts/Auth/forget_password.dart';
import 'package:movie_pojo/ui/layouts/Auth/login.dart';
import 'package:movie_pojo/ui/layouts/Auth/register.dart';
import 'package:movie_pojo/ui/layouts/edit%20profile%20screen/edit_profile_screen.dart';
import 'package:movie_pojo/ui/layouts/home/home_screen.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding1.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding2.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding4.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding5.dart';
import 'package:movie_pojo/ui/layouts/onBoarding/onBoarding6.dart';
import 'package:movie_pojo/ui/layouts/splash%20screen/splash_screen.dart';

import '../../ui/layouts/onBoarding/onBoarding3.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case PageRouteName.onBoarding1:
        return MaterialPageRoute(builder: (_) => const OnBoarding1());
      case PageRouteName.onBoarding2:
        return MaterialPageRoute(builder: (_) => const OnBoarding2());
      case PageRouteName.onBoarding3:
        return MaterialPageRoute(builder: (_) => const OnBoarding3());
      case PageRouteName.onBoarding4:
        return MaterialPageRoute(builder: (_) => const OnBoarding4());
      case PageRouteName.onBoarding5:
        return MaterialPageRoute(builder: (_) => const OnBoarding5());
      case PageRouteName.onBoarding6:
        return MaterialPageRoute(builder: (_) => const OnBoarding6());
      case PageRouteName.logIn:
        return MaterialPageRoute(builder: (_) => const Login());
      case PageRouteName.register:
        return MaterialPageRoute(builder: (_) => const  Register());
      case PageRouteName.forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgetPassword());
      case PageRouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case PageRouteName.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}