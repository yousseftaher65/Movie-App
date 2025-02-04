import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/available_now_widget.dart';
import 'package:movie_pojo/ui/widgets/home_genres_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             const AvailableNowWidget(),
              SizedBox(height: 24.h),
             const HomeGenresWidget()
            ],
          ),
        ),
      ),
    );
  }
}
