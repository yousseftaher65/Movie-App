import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastContainer extends StatelessWidget {
  const CastContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: double.infinity.w,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              'assets/images/avater_1.png',
              height: 70.h,
              width: 70.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : Hayley Atwell',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                'Character : Captain Carter',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
