import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';

class MovieCard extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  const MovieCard({super.key, this.cardHeight = 220, this.cardWidth = 146});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.movieDetails);
      },
      child: Container(
        height: cardHeight.h,
        width: cardWidth.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                'assets/images/movie_poster.jpg',
                fit: BoxFit.cover,
                height: cardHeight.h,
                width: cardWidth.w,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, right: 8, left: 8),
              alignment: Alignment.center,
              height: 28.h,
              width: 58.w,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '8.5',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).hintColor),
                  ),
                  SizedBox(width: 4.h),
                  Image.asset(
                    'assets/icons/rate_icon.png',
                    height: 15.h,
                    width: 15.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
