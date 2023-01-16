import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  /// for backgroud button
  static const Gradient linierButton = LinearGradient(
    colors: [Colors.transparent, Color(0x2AFFF8FF)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  /// background
  static const Gradient linierBg = LinearGradient(
    colors: [Color(0xFFF3F6FF), Color(0xFFD2DDFF)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  /// background orange
  static const Gradient linierOrange = LinearGradient(
    colors: [Color(0xffFF9F0A), Color(0xffFF800A)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  /// background green
  static const Gradient linierGreen = LinearGradient(
    colors: [Color(0xff34C759), Color(0xff22D976)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  /// background red
  static const Gradient linierRed = LinearGradient(
    colors: [Color(0xffFF453A), Color(0xffFF6813)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
}
