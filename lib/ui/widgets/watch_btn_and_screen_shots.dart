import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/movie_details_container.dart';
import 'package:movie_pojo/ui/widgets/screen_shot_widget.dart';

class WatchBtnAndScreenShots extends StatelessWidget {
  const WatchBtnAndScreenShots({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              backgroundColor: Theme.of(context).focusColor),
                          onPressed: () {},
                          child: Text(
                            'watch'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieDetailsContainer(
                              image: 'love',
                              text: '15',
                            ),
                            MovieDetailsContainer(
                              image: 'time',
                              text: '90',
                            ),
                            MovieDetailsContainer(
                              image: 'rate',
                              text: '9.8',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'screen_shots'.tr(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.55.h,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ScreenShotWidget(
                                  image: 'screenshot${index + 1 % 2}');
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemCount: 3,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'similar'.tr(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ],
              );
  }
}