import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/cast_container.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';
import 'package:movie_pojo/ui/widgets/play_movie_widget.dart';
import 'package:movie_pojo/ui/widgets/summary_and_cast.dart';
import 'package:movie_pojo/ui/widgets/watch_btn_and_screen_shots.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: PlayMovieWidget()),
           const SliverToBoxAdapter(
              child: WatchBtnAndScreenShots()
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const MovieCard(
                      cardHeight: double.infinity,
                      cardWidth: double.infinity,
                    );
                  },
                  childCount: 4,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.74,
                    crossAxisCount: 2),
              ),
            ),
           const SliverToBoxAdapter(
              child:  SummaryAndCast(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CastContainer();
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
