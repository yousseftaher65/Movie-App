import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class AvailableNowWidget extends StatelessWidget {
  const AvailableNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: .690,
          child: Image.asset(
            'assets/images/movie_poster.jpg',
            fit: BoxFit.cover,
            //height: 621.h,
            width: double.infinity,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.8),
                  Theme.of(context).primaryColor.withOpacity(0.6),
                  Theme.of(context).primaryColor,
                ]),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/available_now.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 21.h),
              CarouselSlider.builder(
                options: CarouselOptions(
                    initialPage: 1,
                    aspectRatio: 16/9,
                    animateToClosest: true,
                    disableCenter: false,
                    enlargeCenterPage: true,
                    //enableInfiniteScroll: false,
                    viewportFraction: 0.58,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeFactor: 0.46,
                    height: 351.h,
                    scrollDirection: Axis.horizontal
                ),
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return const MovieCard(
                    cardHeight: 351,
                    cardWidth: 234,
                  );
                },
              ),
              SizedBox(height: 21.h),
              Image.asset(
                'assets/images/watch_now.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}