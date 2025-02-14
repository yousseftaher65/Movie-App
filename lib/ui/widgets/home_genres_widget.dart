import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/results.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class HomeGenresWidget extends StatelessWidget {
  final List<Results>? data;
  final String title;
  const HomeGenresWidget({super.key, this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                title,
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
        SizedBox(
          height:220.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
               return MovieCard(
                results: data?[index],
               );
              },
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemCount: data?.length ?? 0),
        ),
        /*  CarouselSlider.builder(
          options: CarouselOptions(
              initialPage: 1,
              aspectRatio: 16 / 9,
              animateToClosest: true,
              enableInfiniteScroll: false,
              disableCenter: true,
              viewportFraction: 0.36,
              scrollDirection: Axis.horizontal),
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            return MovieCard(
              results: data?[index],
            );
          },
        ), */
      ],
    );
  }
}
