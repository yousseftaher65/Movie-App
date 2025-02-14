import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';
import 'package:movie_pojo/ui/widgets/profile_tab_bar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 389.h,
                collapsedHeight: 389.h,
                pinned: false,
                flexibleSpace: const SafeArea(child: ProfileTabBar()),
              )
            ];
          },
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
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, left: 16.w, top: 16.h),
                child: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return const MovieCard(
                            cardHeight: double.infinity,
                            cardWidth: double.infinity,
                          );
                        },
                        childCount: 20,
                      ),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.68,
                          crossAxisCount: 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}