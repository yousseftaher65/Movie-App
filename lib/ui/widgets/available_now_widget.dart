import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/results.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

/// recived top rated data successfully
class AvailableNowWidget extends StatefulWidget {
final List<Results>? data;
  const AvailableNowWidget({super.key,this.data});

  @override
  State<AvailableNowWidget> createState() => _AvailableNowWidgetState();
}

class _AvailableNowWidgetState extends State<AvailableNowWidget> {
  int currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.data != null && widget.data!.isNotEmpty
                    ? "https://image.tmdb.org/t/p/original/${widget.data?[currentIndex].posterPath}"
                    : 'assets/images/movie_poster.jpg',
                fit: BoxFit.cover,
                height: 621.h,
                width: double.infinity,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
              Container(
                 //height: 622.h,
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
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                          //initialPage: 1,
                          aspectRatio: 16 / 9,
                          animateToClosest: true,
                          disableCenter: false,
                          enlargeCenterPage: true,
                          //enableInfiniteScroll: false,
                          viewportFraction:
                              Localizations.localeOf(context).languageCode ==
                                      'ar'
                                  ? 0.50
                                  : 0.60,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          enlargeFactor: 0.46,
                          height: 351.h,
                          scrollDirection: Axis.horizontal),
                      itemCount: widget.data?.length ?? 3,
                      itemBuilder: (context, index, realIndex) {
                        return MovieCard(
                          results: widget.data?[index],
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