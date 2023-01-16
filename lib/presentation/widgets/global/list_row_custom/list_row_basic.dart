import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ListRowBasic extends StatelessWidget {
  final String label;
  final String value;
  final Color? textColor;
  final Color? background;
  final double letterSpacing;
  final bool multiLine;
  final bool isLoaded;
  final double fontSize;
  final bool isShowTooltip;
  final bool? boldLabel;

  const ListRowBasic({
    Key? key,
    required this.label,
    required this.value,
    this.textColor,
    this.background,
    this.letterSpacing = 0.0,
    this.multiLine = false,
    this.isLoaded = true,
    this.fontSize = 14,
    this.isShowTooltip = false,
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
            color: background,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: isShowTooltip
                ? Tooltip(
                    message: value,
                    child: SelectableText(
                      value,
                      maxLines: (multiLine) ? 3 : 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: textColor,
                        fontSize: AppDimens.size2M,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: letterSpacing,
                        height: multiLine ? 1.5 : null,
                      ),
                    ),
                  )
                : SelectableText(
                    value,
                    maxLines: (multiLine) ? 2 : 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: textColor,
                      fontSize: AppDimens.size2M,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: letterSpacing,
                      height: multiLine ? 1.5 : null,
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
