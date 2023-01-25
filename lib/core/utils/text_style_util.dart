import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class AppTextStyle {
  AppTextStyle._();

  /// table title `fsize: 20, color: labelPrimary, weight: semi-bold`
  static TextStyle get tableTitle => TextStyle(
        color: AppColors.labelPrimary,
        fontSize: AppDimens.size4M,
        fontWeight: FontWeight.w600,
      );

  /// card title `fsize: 14, color: labelPrimary, weight: medium`
  static TextStyle get cardTitle => TextStyle(
        color: AppColors.labelPrimary,
        fontSize: AppDimens.size2M,
        fontWeight: FontWeight.w500,
      );

  /// card title `fsize: 18, color: labelPrimary, weight: semi-bold`
  static TextStyle get cardValue => const TextStyle(
        color: AppColors.labelPrimary,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      );

  /// card title `fsize: 20.0, color: labelPrimary, weight: semi-bold`
  static TextStyle get titleDrawer => const TextStyle(
        color: AppColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      );

  /// card title `fsize: 24.0, color: labelPrimary, weight: semi-bold`
  static TextStyle get appBarTitle => const TextStyle(
        color: AppColors.labelPrimary,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      );

  /// for dialog title `fsize: 24, color: labelPrimary, weight: semi-bold`
  static TextStyle get dialogTitle => TextStyle(
        color: AppColors.labelPrimary,
        fontSize: AppDimens.sizeL,
        fontWeight: FontWeight.w600,
      );

  /// for dialog title `fsize: 16, color: labelSecondary, weight: reguler`
  static TextStyle get dialogDesc => TextStyle(
        color: AppColors.labelSecondary,
        fontSize: AppDimens.size3M,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  /// for dialog title `fsize: 16, color: labelSecondary, weight: semi-bold`
  static TextStyle get titleAppProfile => TextStyle(
        color: AppColors.labelPrimary,
        fontSize: AppDimens.size2M,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
      );

  /// for title login page
  static TextStyle get titleLoginPage => TextStyle(
        color: AppColors.white,
        fontSize: AppDimens.size4L,
        fontWeight: FontWeight.w600,
        wordSpacing: 0.35,
      );

  /// for loading title
  static TextStyle get titleLoading => TextStyle(
        color: AppColors.grey.shade100,
        fontSize: AppDimens.size3M,
        fontWeight: FontWeight.w500,
        wordSpacing: 0.35,
      );
}
