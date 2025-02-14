import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';

class AuthBtn extends StatelessWidget {
  late String tittle;
  late Widget prefixIcon;
  late Widget? suffixIcon;
  late bool show;
  late Function(bool)? showPassword;
  late TextEditingController textEditingController;
  FormFieldValidator<String> validator;

  AuthBtn({
    super.key,
    required this.tittle,
    required this.prefixIcon,
    this.suffixIcon,
    required this.show,
    this.showPassword,
    required this.textEditingController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: show,
      obscuringCharacter: '*',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.whiteColor, decoration: TextDecoration.none),
      controller: textEditingController,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.redColor,
            ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        labelText: tittle,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.whiteColor,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: const BorderSide(
            color: AppColors.accentColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: BorderSide(
            color: AppColors.accentColor,
            width: 2.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: BorderSide(
            color: AppColors.accentColor,
            width: 2.w,
          ),
        ),
      ),
    );
  }
}
