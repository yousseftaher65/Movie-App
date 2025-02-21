import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import 'package:movie_pojo/models/screen_shots_response.dart';
import 'package:movie_pojo/ui/widgets/movie_details_container.dart';
import 'package:movie_pojo/ui/widgets/screen_shot_widget.dart';

class WatchBtnAndScreenShots extends StatelessWidget {
  final MovieDetailsResponse? data;
  final ScreenShotsResponse? images;
  final Function onTap;
  const WatchBtnAndScreenShots({super.key, this.data , this.images ,required this.onTap});

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
                onPressed: () {
                  onTap();
                },
                child: Text(
                  'watch'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MovieDetailsContainer(
                    image: 'love',
                    text: data?.voteCount.toString() ?? '',
                  ),
                  MovieDetailsContainer(
                    image: 'time',
                    text: data?.runtime.toString() ?? '',
                  ),
                  MovieDetailsContainer(
                    image: 'rate',
                    text: data?.voteAverage.toString().substring(0, 3) ?? '',
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'screen_shots'.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ScreenShotWidget(
                      image: images?.backdrops?[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),//(data.pageResponse?.results?.length ?? 0) >= 4 ? 4 : data.pageResponse?.results?.length,
                itemCount: (images?.backdrops?.length ?? 0) >= 3 ? 3 : (images?.backdrops?.length ?? 0),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'similar'.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
