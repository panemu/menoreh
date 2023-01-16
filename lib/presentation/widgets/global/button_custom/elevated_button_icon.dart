import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ElevatedButtonIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  /// default backgroundColor is [AppColors.primary]
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? tooltip;

  const ElevatedButtonIcon({
    super.key,
    this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.size4XL,
      child: Tooltip(
        message: tooltip,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: EdgeInsets.all(AppDimens.sizeZero),
          ),
          child: icon,
        ),
      ),
    );
  }
}
