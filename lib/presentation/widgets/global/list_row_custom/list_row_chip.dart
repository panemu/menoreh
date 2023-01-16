import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ListRowChip extends StatelessWidget {
  final String label;
  final String value;
  final bool isLoaded;
  final Color colorClip;
  final double fontSize;
  final bool? boldLabel;

  const ListRowChip({
    Key? key,
    required this.label,
    required this.value,
    required this.colorClip,
    this.isLoaded = true,
    this.fontSize = 14,
    this.boldLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(
              color: boldLabel! ? AppColors.labelPrimary : AppColors.labelSecondary,
              fontWeight: boldLabel! ? FontWeight.w600 : null,
              fontSize: boldLabel! ? AppDimens.size2M : 13,
            ),
          ),
        ),
        SizedBox(width: AppDimens.size3M),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
                color: colorClip.withOpacity(0.1),
              ),
              padding: EdgeInsets.symmetric(horizontal: AppDimens.size2M, vertical: 3.0),
              child: SelectableText(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: colorClip,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
