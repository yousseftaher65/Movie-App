import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/explore_cubit/cubit.dart';
import 'package:movie_pojo/core/cubit/explore_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_repo.dart';
import 'package:movie_pojo/ui/widgets/category_item.dart';
import 'package:movie_pojo/ui/widgets/category_list_widget.dart';
import 'package:movie_pojo/ui/widgets/dialog_utils.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: BlocProvider(
            create: (context) => ExploreCubit(GetMovieRepo())..getMovie(),
            child: BlocConsumer<ExploreCubit, ExploreStates>(
                listener: (context, state) {
              if (state is ExploreLoadingState) {
                context.loaderOverlay.show();
              }
              if (state is ExploreSuccessState) {
                context.loaderOverlay.hide();
              }
              if (state is ExploreErrorState) {
                context.loaderOverlay.hide();
                DialogUtils.showMessage('Error', state.error, "Close", () {
                  Navigator.pop(context);
                }, null, null, context);
              }
            }, builder: (context, state) {
              var cubit = context.read<ExploreCubit>();
              return Column(
                children: [
                  SizedBox(
                    height: 52,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.changeGenre(index);
                            scrollController.animateTo(0.0,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut);
                          },
                          child: CategoryItem(
                            genreName: cubit.genreReponse?.genres?[index].name,
                            isSelected: cubit.currentIndex == index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.w),
                      itemCount: cubit.genreReponse?.genres?.length ?? 0,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      // Check if near the bottom, more pages are available,
                      // and we are not already fetching data.
                      if (scrollInfo.metrics.pixels >=
                              scrollInfo.metrics.maxScrollExtent - 100 &&
                          cubit.hasMorePages &&
                          !cubit.isFetching) {
                        cubit.getMovie(page: cubit.currentPage + 1);
                      }
                      return false;
                    },
                    child: CategoryListWidget(
                      controller: scrollController,
                      results: cubit.loadedMovies,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 20,
                      aspectRatio: 0.74,
                      itemCount: cubit.loadedMovies?.length ?? 0,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
