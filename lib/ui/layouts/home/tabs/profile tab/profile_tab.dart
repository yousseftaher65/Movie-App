import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_states.dart';
import 'package:movie_pojo/core/repository/get_movie_repo.dart';
import 'package:movie_pojo/ui/widgets/build_tab.dart';
import 'package:movie_pojo/ui/widgets/profile_tab_bar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) =>
            UserDataCubit(getMovieInterface: GetMovieRepo())..initUser(),
        child: BlocConsumer<UserDataCubit, UserDataStates>(
            listener: (context, state) => {
                 /*  if (state is UserDataLoadingState)
                    {
                      print('*****************************************loading'),
                      context.loaderOverlay.show(),
                    },
                  if (state is UserDataSuccessState)
                    {
                      context.loaderOverlay.hide(),
                    }, */
                  if (state is UserDataErrorState)
                    {
                      context.loaderOverlay.hide(),
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'something_went_wrong'.tr(),
                          ),
                          content: Text(
                            state.message,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "ok".tr(),
                              ),
                            ),
                          ],
                        ),
                      )
                    },
                },
            builder: (context, state) {
              var bloc = BlocProvider.of<UserDataCubit>(context);
              if (state is UserDataLoadingState) {
                context.loaderOverlay.show();
              }
              if (state is UserDataSuccessState) {
                context.loaderOverlay.hide();
                return Scaffold(
                  body: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          expandedHeight: 389.h,
                          collapsedHeight: 389.h,
                          pinned: false,
                          flexibleSpace: SafeArea(
                            child: ProfileTabBar(
                              userBloc: bloc,
                            ),
                          ),
                        )
                      ];
                    },
                    body: TabBarView(
                      children: [
                        BuildTab(
                          data: bloc.favoriteResponse,
                        ),
                        BuildTab(
                          data: bloc.historyResponse,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
