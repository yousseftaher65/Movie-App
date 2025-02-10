import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsContainer extends StatelessWidget {
  final String image;
  final String text;
  const MovieDetailsContainer({super.key,required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 122.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).secondaryHeaderColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            color: Theme.of(context).cardColor,
            size: 28,
             AssetImage('assets/icons/${image}_icon.png'),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ],
      ),
    );
  }
}
