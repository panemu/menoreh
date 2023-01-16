import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';

class MainTable extends StatelessWidget {
  final DataGridSource source;

  /// The number of rows to show on each page.
  final int rowsPerPage;

  /// please use class on path `table_custom/columns_table.dart`
  final List<GridColumn> columns;

  /// default is false
  final bool? allowSorting;

  /// mode Scrollable
  final ColumnWidthMode? columnWidthMode;

  /// on click on the row
  final void Function(DataGridCellTapDetails)? onCellTap;

  const MainTable({
    super.key,
    required this.source,
    required this.rowsPerPage,
    required this.columns,
    this.onCellTap,
    this.columnWidthMode = ColumnWidthMode.fill,
    this.allowSorting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.responsiveValue<EdgeInsetsGeometry>(
        desktop: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX),
        tablet: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX),
        mobile: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX),
      ),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: AppColors.grey.shade100,
          rowHoverColor: AppColors.grey.shade50,
          selectionColor: AppColors.lightBlue,
        ),
        child: SfDataGrid(
          source: source,
          rowsPerPage: rowsPerPage,
          headerRowHeight: AppDimens.headingRowHeight,
          rowHeight: AppDimens.rowHeight,
          allowSorting: allowSorting!,
          columnWidthMode: context.isTabletUnder ? ColumnWidthMode.none : columnWidthMode!,
          onCellTap: onCellTap,
          columns: columns,
        ),
      ),
    );
  }
}
