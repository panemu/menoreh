import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ChipWidget extends StatelessWidget {
  /// [chipType] default is [ChipType.normal]
  final ChipType? chipType;
  final Color color;
  final String value;

  /// [fontSize] default is `13.0`
  final double? fontSize;

  const ChipWidget({
    super.key,
    required this.color,
    required this.value,
    this.chipType = ChipType.normal,
    this.fontSize = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
        color: chipType!.isNormal ? color : color.withOpacity(0.1),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppDimens.size2M, vertical: 3.0),
      child: Text(
        value,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: chipType!.isNormal ? AppColors.white : color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
