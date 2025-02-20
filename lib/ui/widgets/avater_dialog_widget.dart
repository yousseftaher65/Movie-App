import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvaterDialogWidget extends StatefulWidget {
  final Function(int) onAvatarSelected;

  const AvaterDialogWidget({super.key, required this.onAvatarSelected});

  @override
  State<AvaterDialogWidget> createState() => _AvaterDialogWidgetState();
}

int currentIndex = 0;

class _AvaterDialogWidgetState extends State<AvaterDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 389.h,
            padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 17.h),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 19.h,
                  crossAxisSpacing: 18.w,
                  childAspectRatio: 1.024.sp),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                    widget.onAvatarSelected(index);
                  },
                  child: Container(
                    padding:
                         EdgeInsets.symmetric(horizontal: 11.w, vertical: 9.h),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Theme.of(context).cardColor.withOpacity(0.50)
                          : Colors.transparent,
                      border: Border.all(color: Theme.of(context).cardColor),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Image.asset(
                      'assets/images/avater_${index + 1 % 2}.png',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
