import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/movie_details_cubit/cubit.dart';
import 'package:movie_pojo/core/cubit/movie_details_cubit/states.dart';
import 'package:movie_pojo/ui/widgets/cast_container.dart';
import 'package:movie_pojo/ui/widgets/dialog_utils.dart';
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
        body: BlocConsumer<MovieDetailsCubit, MovieDetailsStates>(
          listener: (context, state) {
            if (state is MovieDetailsErrorState) {
              context.loaderOverlay.hide();
              Navigator.pop(context);
              DialogUtils.showMessage(
                'Error',
                state.error,
                'Close',
                () {},
                null,
                null,
                context,
              );
            }
          },
          builder: (context, state) {
            var data = context.read<MovieDetailsCubit>();
            if (state is MovieDetailsLoadingState) {
              context.loaderOverlay.show();
            }
            if (state is MovieDetailsSuccessState) {
              context.loaderOverlay.hide();
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: PlayMovieWidget(
                    onTap: () {
                      if (data.isfav()) {
                        data.removeFavorite();
                      } else {
                        data.addFavorite();
                      }
                    },
                    isfav: data.isfav(),
                    data: data.movieDetailsResponse,
                  ),
                ),
                SliverToBoxAdapter(
                  child: WatchBtnAndScreenShots(
                    onTap: () {
                      data.addHistory();
                    },
                    images: data.screenShotsResponse,
                    data: data.movieDetailsResponse,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MovieCard(
                          results: data.pageResponse?.results?[index],
                          cardHeight: double.infinity,
                          cardWidth: double.infinity,
                        );
                      },
                      childCount: (data.pageResponse?.results?.length ?? 0) >= 4
                          ? 4
                          : data.pageResponse?.results?.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 0.74,
                        crossAxisCount: 2),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SummaryAndCast(
                    data: data.movieDetailsResponse,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverList.separated(
                    itemCount: (data.castResponse?.cast?.length ?? 0) >= 5
                        ? 5
                        : data.castResponse?.cast?.length,
                    itemBuilder: (context, index) {
                      return CastContainer(
                        data: data.castResponse?.cast?[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.h,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
