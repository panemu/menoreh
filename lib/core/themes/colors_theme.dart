import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // app color
  static const Color primary = Color(0xFF021659);
  static const Color secondary = Color(0xFF007AFF);

  // card color
  static const Color rasaKarsa = Color(0xFF5856D6);
  static const Color tebakGambar = Color(0xFF248165);
  static const Color truthDare = Color(0xFF763131);
  static const Color tebakKata = Color(0xFF0076F7);

  // 3rd apps color
  static const Color google = Color(0xFFDB4437);
  static const Color facebook = Color(0xFF1877F2);
  static const Color apple = Color(0xFF1C1C1E);
  static const Color email = Color(0xFF34C759);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFFF4896);
  static const Color tiktok = Colors.black;

  // component color
  static const Color divider = Color(0xFFC6C6C8);
  static const Color dividerLight = Color(0xFFEBEBF5);
  static const Color danger = Color(0xFFFF453A);
  static const Color warning = Color(0xFFFF9F0A);
  static const Color success = Color(0xFF32D74B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparant = Colors.transparent;
  static const Color splash = Color(0x2AFFF8FF);
  static const Color listMenu = Color(0xFF1F3682);

  // border
  static final Color borderGrey = Colors.grey.shade300;

  // label text
  static const Color labelPrimary = Color(0xFF000000);
  static Color labelSecondary = const Color(0xFF3C3C43).withOpacity(0.6);
  static Color labelTertiary = const Color(0xFF3C3C43).withOpacity(0.3);
  static Color labelQuarternary = const Color(0xFF3C3C43).withOpacity(0.18);

  // fill color
  static Color fillPrimary = const Color(0xFF787880).withOpacity(0.2);
  static Color fillSecondary = const Color(0xFF787880).withOpacity(0.16);
  static Color fillTertiary = const Color(0xFF767680).withOpacity(0.12);
  static Color fillQuarternary = const Color(0xFF747480).withOpacity(0.08);

  // system fill color
  static const Color red = Color(0xFFFF3B30);
  static const Color orange = Color(0xFFFF9500);
  static const Color yellow = Color(0xFFFFCC00);
  static const Color green = Color(0xFF34C759);
  static const Color tial = Color(0xFF5AC8FA);
  static const Color blue = Color(0xFF007AFF);
  static const Color indigo = Color(0xFF5856D6);
  static const Color purple = Color(0xFFAF52DE);
  static const Color pink = Color(0xFFFF2D55);

  // system light color
  static const Color lightRed = Color(0xFFFFDDDB);
  static const Color lightOrange = Color(0xFFFFEDD3);
  static const Color lightYellow = Color(0xFFFFF6D3);
  static const Color lightGreen = Color(0xFFDBF6E2);
  static const Color lightTial = Color(0xFFE2F5FE);
  static const Color lightBlue = Color(0xFFD3E8FF);
  static const Color lightIndigo = Color(0xFFE2E2F8);
  static const Color lightPurple = Color(0xFFF1E1F9);
  static const Color lightPink = Color(0xFFFFDAE1);

  // backgroud color
  static const Color bgPrimary = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF2F2F7);
  

  /// [MaterialColor] theme map color
  static const MaterialColor grey = MaterialColor(
    0xFF8E8E93,
    <int, Color>{
      50: Color(0xFFF2F2F7), //10%
      100: Color(0xFFE5E5EA), //20%
      200: Color(0xFFD1D1D6), //30%
      300: Color(0xFFC7C7CC), //40%
      400: Color(0xFFAEAEB2), //50%
      500: Color(0xFF8E8E93), //60%
      600: Color(0xFF636366), //70%
      700: Color(0xFF48484A), //80%
      800: Color(0xFF3A3A3C), //90%
      850: Color(0xFF2C2C2E), //95%
      900: Color(0xFF1C1C1E), //100%
    },
  );

  /// [MaterialColor] theme map color
  static const MaterialColor primaryTheme = MaterialColor(
    0xff021659,
    <int, Color>{
      50: Color(0xff021450), //10%
      100: Color(0xff021247), //20%
      200: Color(0xff010f3e), //30%
      300: Color(0xff010d35), //40%
      400: Color(0xff010b2d), //50%
      500: Color(0xff010924), //60%
      600: Color(0xff01071b), //70%
      700: Color(0xff000412), //80%
      800: Color(0xff000209), //90%
      900: Color(0xff000000), //100%
    },
  );
}
