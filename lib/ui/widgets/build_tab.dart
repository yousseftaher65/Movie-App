import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class BuildTab extends StatelessWidget {
  final List<MovieDetailsResponse>? data;
  const BuildTab({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null || data?.isEmpty == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/empty.png'),
          ),
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(right: 16.0.w, left: 16.w, top: 16.h),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return MovieCard(
                    movieDetailsResponse: data?[index],
                    cardHeight: double.infinity,
                    cardWidth: double.infinity,
                  );
                },
                childCount: data?.length ?? 0,
              ),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68.sp,
                  crossAxisCount: 3),
            ),
          ],
        ),
      );
    }
  }
}