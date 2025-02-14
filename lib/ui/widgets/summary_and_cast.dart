import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/movie_details_response.dart';

class SummaryAndCast extends StatelessWidget {
 final MovieDetailsResponse? data;
  const SummaryAndCast({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Text(
            'summary'.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
           data?.overview ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 10,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'cast'.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
