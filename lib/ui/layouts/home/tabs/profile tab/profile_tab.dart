import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/category_list_widget.dart';
import 'package:movie_pojo/ui/widgets/profile_tab_bar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(double.infinity.w, 389.h),
          child: const SafeArea(child: ProfileTabBar()),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/empty.png'),
                ),
              ],
            ),
           const Padding(
              padding: EdgeInsets.only(right: 16.0 , left: 16 , top: 16),
              child: Column(
                children: [
                  CategoryListWidget(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    aspectRatio: 0.68,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
