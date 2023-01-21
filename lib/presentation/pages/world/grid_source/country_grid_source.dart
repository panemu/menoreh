import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryGridSource extends DataGridSource {
  CountryGridSource({required this.countryEntity, required this.countryCount, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
  }

  final List<CountryEntity> countryEntity;
  List<CountryEntity> paginatedDataSource = [];
  int countryCount;
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => countryEntity.map<DataGridRow>((CountryEntity order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('capital'), value: order.capital),
          DataGridCell<String>(columnName: getColumnName('continent'), value: order.continent),
          DataGridCell<String>(
              columnName: getColumnName('independence'), value: order.independence.toDateTime().yMMMMd),
          DataGridCell<String>(columnName: getColumnName('population'), value: order.population.textDecimalDigit),
        ]);
      }).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = rows.indexOf(row);
    Color backgroundColor = AppColors.white;
    if ((rowIndex % 2) == 0) {
      backgroundColor = AppColors.grey.shade50;
    }

    return DataGridRowAdapter(
      color: backgroundColor,
      cells: <Widget>[
        RowTableBasic(tableType: TableType.text, value: row.getCells()[0].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[1].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[5].value.toString()),
      ],
    );
  }

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMediumX),
      child: Text(
        summaryValue,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    await Future.delayed(const Duration(seconds: 3));

    int startIndex = newPageIndex * 15;
    int endIndex = startIndex + 15;
    
    if (startIndex < countryEntity.length) {
      if (endIndex > countryEntity.length) {
        endIndex = countryEntity.length;
      }
      paginatedDataSource = countryEntity.getRange(startIndex, endIndex).toList(growable: false);
      // buildDataGridRows();
    } else {
      paginatedDataSource = [];
    }
    notifyListeners();
    return true;
  }

  String getColumnName(String columnName) {
    if (isFilteringSample) {
      switch (columnName) {
        case 'id':
          return 'id';
        case 'name':
          return 'Name';
        case 'capital':
          return 'Capital City';
        case 'continent':
          return 'Continent';
        case 'independence':
          return 'Independence Day';
        case 'population':
          return 'Population';
        default:
          return columnName;
      }
    }
    return columnName;
  }
}
