import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/category_item.dart';
import 'package:movie_pojo/ui/widgets/category_list_widget.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

int _currentIndex = 0;

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 52,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: CategoryItem(isSelected: _currentIndex == index)
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8.w),
                    itemCount: 5),
              ),
              SizedBox(
                height: 24.h,
              ),
              const CategoryListWidget(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 20,
                aspectRatio: 0.74,
              )
            ],
          ),
        ),
      ),
    );
  }
}