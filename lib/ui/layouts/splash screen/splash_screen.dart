import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pushNamedAndRemoveUntil(context, PageRouteName.onBoarding1 , (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Bounce(
              duration: const Duration(milliseconds: 1750),
              child: Image.asset(
                'assets/logos/app_logo.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
