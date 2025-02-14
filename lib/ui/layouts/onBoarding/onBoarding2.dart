import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';
import '../../../core/routes/page_route_name.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/poster2.png",
          height: 932.h,
          width: 430.w,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 280.h,
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
                            "onboarding_two_title".tr(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "onboarding_two_content".tr(),
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
                          Navigator.pushNamed(
                              context, PageRouteName.onBoarding3);
                        },
                        child: Text(
                          "next".tr(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    )
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
