import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

double _kWidthRow = 240.0;
double _kWidthRowId = 60.0;

class ColumnTableText extends GridColumn {
  /// the [width] : default is `240.0` and if size [isDesktop] the value [double.nan]
  /// the [alignment] : default is [Alignment.centerLeft]
  ColumnTableText({
    required BuildContext context,
    required String columnName,
    required String value,
    Alignment? alignment,
    double? width,
  }) : super(
          columnName: columnName,
          width: (width != null)
              ? width
              : (context.isDesktop)
                  ? _kWidthRow
                  : double.nan,
          label: Container(
            padding: const EdgeInsets.all(AppDimens.paddingSmallX),
            alignment: alignment ?? Alignment.centerLeft,
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        );
}

class ColumnTableId extends GridColumn {
  /// the [width] : default is `60.0`
  /// the [alignment] : default is [Alignment.centerLeft],
  /// default [columnName] is 'id'
  ColumnTableId({
    required BuildContext context,
    String? columnName,
    required String value,
    Alignment? alignment,
    double? width,
  }) : super(
          columnName: columnName ?? 'id',
          width: (width != null)
              ? width
              : _kWidthRowId,
          label: Container(
            padding: const EdgeInsets.all(AppDimens.paddingSmallX),
            alignment: alignment ?? Alignment.centerLeft,
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        );
}

class ColumnTableNumber extends GridColumn {
  /// the [width] : default is `240.0` and if size [isDesktop] the value [double.nan]
  /// the [alignment] : default is [Alignment.centerRight]
  ColumnTableNumber({
    required BuildContext context,
    required String columnName,
    required String value,
    Alignment? alignment,
    double? width,
  }) : super(
          columnName: columnName,
          width: (width != null)
              ? width
              : (context.isDesktop)
                  ? _kWidthRow
                  : double.nan,
          label: Container(
            padding: const EdgeInsets.all(AppDimens.paddingSmallX),
            alignment: alignment ?? Alignment.centerRight,
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        );
}

class ColumnTableAction extends GridColumn {
  /// the [width] : default is `240.0` and if size [isDesktop] the value [double.nan]
  /// the [alignment] : default is [Alignment.center]
  ColumnTableAction({
    required BuildContext context,
    required String columnName,
    required String value,
    Alignment? alignment,
    double? width,
  }) : super(
          columnName: columnName,
          width: (width != null)
              ? width
              : (context.isDesktop)
                  ? _kWidthRow
                  : double.nan,
          label: Container(
            padding: const EdgeInsets.all(AppDimens.paddingSmallX),
            alignment: alignment ?? Alignment.center,
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        );
}

class ColumnTableText2 extends DataColumn {
  /// the [width] : default is `240.0` and if size [isDesktop] the value [double.nan]
  /// the [alignment] : default is [Alignment.centerLeft]
  ColumnTableText2({
    // required BuildContext context,
    // required String columnName,
    required String value,
    Alignment? alignment,
    double? width,
  }) : super(
          // columnName: columnName,
          // width: (width != null)
          //     ? width
          //     : (context.isDesktop)
          //         ? _kWidthRow
          //         : double.nan,
          label: Container(
            alignment: alignment ?? Alignment.centerLeft,
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        );
}
