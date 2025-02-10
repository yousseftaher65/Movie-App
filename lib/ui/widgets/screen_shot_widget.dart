import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenShotWidget extends StatelessWidget {
  final String image;
  const ScreenShotWidget({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(
        'assets/images/$image.png',
        height: 167.h,
        width: double.infinity.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
