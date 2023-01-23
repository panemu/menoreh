import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class RowTableBasic extends StatelessWidget {
  /// the [tableType] default is [TableType.text]
  final TableType tableType;
  final String value;

  /// the `chipColor` required [tableType] is [TableType.chip]
  final Color? chipColor;

  const RowTableBasic({
    super.key,
    this.tableType = TableType.text,
    this.chipColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (tableType.isChip) {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingSmallX),
        alignment: Alignment.centerLeft,
        child: Offstage(
          offstage: value.isEmpty,
          child: ChipWidget(
            chipType: ChipType.light,
            color: chipColor!,
            value: value,
          ),
        ),
      );
    } else if (tableType.isNumber) {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingSmallX),
        alignment: Alignment.centerRight,
        child: Offstage(
          offstage: value.isEmpty,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else if (tableType.isLink) {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingSmallX),
        alignment: Alignment.centerLeft,
        child: Offstage(
          offstage: value.isEmpty,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingSmallX),
        alignment: Alignment.centerLeft,
        child: Offstage(
          offstage: value.isEmpty,
          child: Text(
            value.isEmpty ? '-' : value,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
  }
}

class RowTableUser extends StatelessWidget {
  final String avatarUrl;
  final String value;

  const RowTableUser({super.key, required this.avatarUrl, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingSmallX),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClickableImageWidget(imageUrl: avatarUrl, size: Size(AppDimens.size2L, AppDimens.size2L)),
          SizedBox(width: AppDimens.size2S),
          SelectableText(value, style: const TextStyle(overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

/// for use [RowTableAction]
/// ``` dart
/// RowTableAction(
///   actions: [
///     IconTable(
///       icon: const Icon(Icons.link_outlined),
///       color: AppColors.blue,
///       onPressed: () {
///         debugPrint(row.getCells()[2].value.toString());
///       },
///     ),
///     IconTable(
///       onPressed: () {
///         debugPrint(row.getCells()[2].value.toString());
///       },
///       icon: const Icon(Icons.delete),
///       color: AppColors.red,
///     ),
///   ],
/// ),
///
/// ```
class RowTableAction extends StatelessWidget {
  final List<IconTable> actions;

  const RowTableAction({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: actions,
    );
  }
}

class IconTable extends StatelessWidget {
  final Icon icon;
  final Color color;
  final VoidCallback? onPressed;

  const IconTable({super.key, required this.icon, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: AppDimens.size4M,
      color: onPressed != null ? color : AppColors.labelSecondary,
      splashRadius: AppDimens.size4M,
      padding: EdgeInsets.all(AppDimens.sizeZero),
    );
  }
}
