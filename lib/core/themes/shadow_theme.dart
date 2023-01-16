import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  /// shadow for button
  static BoxShadow button = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 16,
    offset: const Offset(0, -2),
  );

  /// for shadow card or container
  static BoxShadow card = BoxShadow(
    color: Colors.black.withOpacity(0.04),
    spreadRadius: 1,
    blurRadius: 36,
    offset: const Offset(0, 4),
  );

  /// soft
  static BoxShadow soft = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 20,
    offset: const Offset(-2, 0),
  );
}
