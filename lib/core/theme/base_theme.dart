import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';

class BaseTheme {
  static TextStyle get onBoardingTitleTxt => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );
  static TextStyle get onBoardingContentTxt => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 20,
      );

  static TextStyle get onBoardingButtonTxt => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  static TextStyle get categoryTxt => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );

  static TextStyle get titleTxt => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );

  static TextStyle get supTitleTxt => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );

  static TextStyle get contentTxt =>
      GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 16);

  static TextStyle get supContentTxt => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    hintColor: AppColors.whiteColor,
    cardColor: AppColors.accentColor,
    focusColor: AppColors.redColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: titleTxt.copyWith(color: AppColors.accentColor),
    ),
    textTheme: TextTheme(
      headlineLarge: onBoardingTitleTxt.copyWith(
        color: AppColors.whiteColor
      ),
      headlineMedium: onBoardingContentTxt.copyWith(
        color: AppColors.whiteColor,
      ),
      headlineSmall: onBoardingButtonTxt.copyWith(
        color: AppColors.primaryColor
      ),
      titleLarge: titleTxt,
      titleMedium: supTitleTxt,
      bodyLarge: contentTxt,
      bodyMedium: supContentTxt,
      bodySmall: categoryTxt,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: contentTxt.copyWith(
        color: AppColors.whiteColor
      ),
      prefixIconColor: AppColors.whiteColor,
      prefixStyle: contentTxt.copyWith(
        color: AppColors.whiteColor
      ),
      fillColor: AppColors.secondaryColor,
      filled: true,
      suffixIconColor: AppColors.whiteColor,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: AppColors.accentColor
      )
    )
  );
}
