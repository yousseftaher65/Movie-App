import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_states.dart';
import 'package:movie_pojo/core/models/user_model.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';

class ProfileTabBar extends StatelessWidget {
  final UserModel? model;

  const ProfileTabBar({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..intUser(),
      child: BlocConsumer<UserDataCubit, UserDataStates>(
        listener: (context, state) {
          if (state is UserDataErrorState) {
            Navigator.pop(context);
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
            );
          } else if (state is UserDataLoadingState) {
            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          var userBloc = BlocProvider.of<UserDataCubit>(context);
          if (state is UserDataLoadingState) {
            context.loaderOverlay.show(
              showOverlay: false,
              widgetBuilder: (_) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.accentColor,
                ),
              ),
            );
          }
          if (state is UserDataSuccessState) {
            context.loaderOverlay.hide();
          }
          return Container(
            color: Theme.of(context).secondaryHeaderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 42.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/avater_${(userBloc.userModel?.imageIndex ?? 0) + 1}.png',
                            fit: BoxFit.cover,
                            height: 118.h,
                            width: 118.h,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "${userBloc.userModel?.name}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 36),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'watch_list'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 36),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'history'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: SizedBox(
                    height: 56.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                PageRouteName.editProfile,
                                arguments: userBloc.userData,
                              );
                            },
                            child: Text(
                              'edit_profile'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              userBloc.logOut();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                PageRouteName.logIn,
                                (_) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).focusColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'exit'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                      ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.logout_outlined,
                                  color: Theme.of(context).hintColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TabBar(
                  unselectedLabelColor: Theme.of(context).hintColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  indicatorColor: Theme.of(context).cardColor,
                  dividerColor: Colors.transparent,
                  labelColor: Theme.of(context).hintColor,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  labelPadding: EdgeInsets.only(bottom: 8.h),
                  tabs: [
                    Tab(
                      icon: ImageIcon(
                        size: 29.sp,
                        color: Theme.of(context).cardColor,
                        const AssetImage(
                          'assets/icons/menu_icon.png',
                        ),
                      ),
                      child: Text(
                        'watch_list'.tr(),
                      ),
                    ),
                    Tab(
                      icon: ImageIcon(
                        size: 39,
                        color: Theme.of(context).cardColor,
                        const AssetImage('assets/icons/folder_icon.png'),
                      ),
                      child: Text(
                        'history'.tr(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
