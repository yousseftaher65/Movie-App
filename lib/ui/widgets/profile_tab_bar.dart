import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 38.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/avater_1.png',
                      //fit: BoxFit.cover,
                      height: 118.h,
                      width: 118.w,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Youssef Taher',
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).hintColor, fontSize: 36),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'watch_list'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '10',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).hintColor, fontSize: 36),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'history'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
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
            padding: EdgeInsets.symmetric(horizontal: 16.w,),
            child: SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PageRouteName.editProfile);
                      },
                      child: Text(
                        'edit_profile'.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
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
                      onPressed: () {},
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
                            size: 24.sp,
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
            labelPadding: EdgeInsets.only(bottom: 16.h),
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
