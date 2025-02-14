import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/base_states.dart';
import 'package:movie_pojo/core/cubit/home_cubit/cubit.dart';
import 'package:movie_pojo/core/cubit/home_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_repo.dart';
import 'package:movie_pojo/ui/widgets/available_now_widget.dart';
import 'package:movie_pojo/ui/widgets/dialog_utils.dart';
import 'package:movie_pojo/ui/widgets/home_genres_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocProvider(
        create: (context) => HomeTabCubit(GetMovieRepo())..getMovie(),
        child:
            BlocConsumer<HomeTabCubit, BaseStates>(listener: (context, state) {
          if (state is HomeTabErrorState) {
            context.loaderOverlay.hide();
            DialogUtils.showMessage(
                'Error', state.error, 'Close', () {}, null, null, context);
          }
        }, builder: (context, state) {
          if (state is HomeTabLoadingState) {
            context.loaderOverlay.show();
          } else if (state is HomeTabSuccessState) {
            context.loaderOverlay.hide();
          } else if (state is HomeTabErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    state.error,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Theme.of(context).cardColor),
                  ),
                )
              ],
            );
          }
          var cubit = context.read<HomeTabCubit>();
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AvailableNowWidget(
                  data: cubit.nowPlayingMovies?.results,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  HomeGenresWidget(
                    data: cubit.popularMovies?.results,
                    title: "Popular",
                  ),
                  SizedBox(height: 20.h),
                  HomeGenresWidget(
                    data: cubit.trendingMovies?.results,
                    title: "Trending",
                  ),
                  SizedBox(height: 20.h),
                  HomeGenresWidget(
                    data: cubit.topRatedMovies?.results,
                    title: "Top Rated",
                  ),
                  SizedBox(height: 20.h),
                  HomeGenresWidget(
                    data: cubit.upcomingMovies?.results,
                    title: "UpComing",
                  ),
                  SizedBox(height: 20.h),
                ]),
              )
            ],
          );
        }),
      ),
    );
  }
}
