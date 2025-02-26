import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/screen_shots_response.dart';

class ScreenShotWidget extends StatelessWidget {
  final Backdrops? image;
  const ScreenShotWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/original/${image?.filePath}',
        height: 167.h,
        width: double.infinity.w,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).cardColor,
          ),
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
