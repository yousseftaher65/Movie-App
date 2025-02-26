// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/ui/widgets/onboarding_fragment.dart';

class OnBoardingScreen extends StatefulWidget {
  static const tag = "OnBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/poster2.png",
      "title": "onboarding_two_title",
      "description": "onboarding_two_content",
    },
    {
      "image": "assets/images/poster3.png",
      "title": "onboarding_three_title",
      "description": "onboarding_three_content",
    },
    {
      "image": "assets/images/poster4.png",
      "title": "onboarding_four_title",
      "description": "onboarding_four_content",
    },
    {
      "image": "assets/images/poster5.png",
      "title": "onboarding_five_title",
      "description": "onboarding_five_content",
    },
    {
      "image": "assets/images/poster6.png",
      "title": "onboarding_six_title",
    },
  ];

  void nextPage() {
    if (_controller.page?.toInt() == onboardingData.length - 1) {
      Navigator.pushNamedAndRemoveUntil(
          context, PageRouteName.logIn, (route) => false);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (_controller.page?.toInt() != 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.ease,
      );
    }
  }

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int newIndex = _controller.page?.round() ?? 0;
      if (newIndex != selectedIndex) {
        setState(() {
          selectedIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index]["image"] ?? '',
                width: double.infinity.w,
                height: double.infinity.h,
                fit: BoxFit.cover,
              );
            },
          ),
          OnboardingFragment(
            title: onboardingData[selectedIndex]["title"] ?? '',
            description: onboardingData[selectedIndex]["description"] ?? '',
            index: selectedIndex,
            onBack: previousPage,
            onNext: nextPage,
          ),
        ],
      ),
    );
  }
}
