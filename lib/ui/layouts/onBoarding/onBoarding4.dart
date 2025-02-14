import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/page_route_name.dart';
import '../../../core/theme/app_colors.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          "assets/images/poster4.png",
          height: 932.h,
          width: 430.w,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 365.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 24.0.h, left: 16.w, right: 16.w, bottom: 16.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Column(
                        children: [
                          Text(
                            "onboarding_four_title".tr(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "onboarding_four_content".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.whiteColor),
                          ),
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
                          Navigator.pushNamed(context, PageRouteName.onBoarding5);
                        },
                        child: Text(
                          "next".tr(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageRouteName.onBoarding3);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          side: BorderSide(
                              width: 2.w,
                              color: AppColors.accentColor
                          ),
                        ),
                        child: Text(
                          "back".tr(),
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.accentColor
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
