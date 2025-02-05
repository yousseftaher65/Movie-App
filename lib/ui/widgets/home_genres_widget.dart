import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class HomeGenresWidget extends StatelessWidget {
  const HomeGenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Action',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).hintColor),
              ),
              const Spacer(),
              Text(
                'see_more'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).cardColor),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.arrow_forward,
                color: Theme.of(context).cardColor,
                size: 15,
              )
            ],
          ),
        ),
        SizedBox(height: 16.h),
        CarouselSlider.builder(
          options: CarouselOptions(
              initialPage: 1,
              aspectRatio: 16 / 9,
              animateToClosest: true,
              disableCenter: true,
              viewportFraction: 0.36,
              scrollDirection: Axis.horizontal),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return const MovieCard();
          },
        ),
      ],
    );
  }
}