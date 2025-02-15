import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/poster1.png",
          height: 932.h,
          width: 430.w,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  children: [
                    Text(
                      "onboarding_one_title".tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text("onboarding_one_content".tr(),
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, PageRouteName.onBoardingScreen , (route)=> false);
                  },
                  child: Text(
                    "explore_now.".tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}