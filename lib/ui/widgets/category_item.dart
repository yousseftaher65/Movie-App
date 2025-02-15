import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
 final String? genreName;
  const CategoryItem({super.key,this.genreName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).cardColor : Colors.transparent,
        border: Border.all(
          width: 2,
          color: Theme.of(context).cardColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        genreName ?? 'Action',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor),
      ),
    );
  }
}
