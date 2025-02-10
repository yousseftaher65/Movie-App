import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryAndCast extends StatelessWidget {
  const SummaryAndCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Text(
            'summary'.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 10,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'cast'.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
