import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';

class OnboardingFragment extends StatelessWidget {
  final Function onBack;
  final Function onNext;
  final int index;
  final String description;
  final String title;
  const OnboardingFragment(
      {super.key,
      required this.description,
      required this.index,
      required this.title,
      required this.onBack,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
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
                        title.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      if (index != 5)
                        SizedBox(
                          height: 16.h,
                        ),
                      Text(
                        description.tr(),
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
                      onNext();
                    },
                    child: Text(
                      index < 4 ? "next".tr() : "finish".tr(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (index >= 1 && index <= 5)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        onBack();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        side: BorderSide(
                            width: 2.w, color: AppColors.accentColor),
                      ),
                      child: Text(
                        "back".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: AppColors.accentColor),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
