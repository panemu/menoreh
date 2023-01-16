import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class OutlinedButtonIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  /// default color is [AppColors.labelSecondary]
  final Color? color;
  final String? tooltip;

  const OutlinedButtonIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.size4XL,
      child: Tooltip(
        message: tooltip,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: color ?? AppColors.labelSecondary,
            side: BorderSide(color: color ?? AppColors.labelSecondary),
            padding: EdgeInsets.all(AppDimens.sizeZero),
          ),
          child: icon,
        ),
      ),
    );
  }
}
