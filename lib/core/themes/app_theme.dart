import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    late ThemeData base = ThemeData.light();

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(),
      primaryColor: AppColors.primaryTheme,
      colorScheme: base.colorScheme.copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
      splashColor: AppColors.splash,
      primaryColorLight: AppColors.primaryTheme,
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.labelPrimary,
        labelColor: AppColors.white,
        labelPadding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
        indicator: const TabIndicator(
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.secondary,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return AppColors.transparent;
        }),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: base.textTheme.headline1!.copyWith(
          color: AppColors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.grey.shade900,
        behavior: SnackBarBehavior.floating,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.5,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.secondary,
        selectedLabelStyle: base.textTheme.bodyText2!.copyWith(fontSize: 13.0),
        unselectedLabelStyle: base.textTheme.bodyText2!.copyWith(fontSize: 12.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
          foregroundColor: AppColors.primary,
          minimumSize: Size(AppDimens.size8X, AppDimens.size3XL),
          elevation: 0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          minimumSize: Size(AppDimens.size8X, AppDimens.size3XL),
          shadowColor: AppColors.transparent,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(width: 1.0, color: AppColors.primary),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
          minimumSize: Size(AppDimens.size8X, AppDimens.size3XL),
          shadowColor: AppColors.transparent,
          elevation: 0,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.secondary;
          } else if (states.contains(MaterialState.hovered)) {
            return AppColors.splash;
          }
          return AppColors.fillPrimary;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.secondary;
          } else if (states.contains(MaterialState.hovered)) {
            return AppColors.splash;
          }
          return AppColors.fillPrimary;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey.shade50, width: 1),
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
        ),
        hintStyle: TextStyle(color: AppColors.grey.shade500),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
      ),
    );
  }
}
