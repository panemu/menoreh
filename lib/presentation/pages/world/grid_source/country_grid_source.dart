import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryGridSource extends DataGridSource {
  CountryGridSource(
    BuildContext context, {
    required this.countryEntity,
    required this.countryCount,
    bool? isFilteringSample,
  }) {
    this.isFilteringSample = isFilteringSample ?? false;

    if (countryEntity.isNotEmpty) {
      paginatedDataSource = countryEntity;
      buildPaginatedDataGridRows();
    }
  }

  final List<CountryEntity> countryEntity;
  List<CountryEntity> paginatedDataSource = <CountryEntity>[];
  int countryCount;
  late bool isFilteringSample;
  List<DataGridRow> gridRows = <DataGridRow>[];
  final int _rowsPerPage = 50;

  @override
  List<DataGridRow> get rows => gridRows;

  void buildPaginatedDataGridRows() {
    gridRows = paginatedDataSource.map<DataGridRow>((CountryEntity country) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<int>(columnName: _getColumnName('id'), value: country.id),
        DataGridCell<String>(columnName: _getColumnName('name'), value: country.name),
        DataGridCell<String>(columnName: _getColumnName('capital'), value: country.capital),
        DataGridCell<String>(columnName: _getColumnName('continent'), value: country.continent),
        DataGridCell<String>(columnName: _getColumnName('independence'), value: country.independence.isEmpty ? '' : country.independence.toDateTime().yMMMMd),
        DataGridCell<String>(columnName: _getColumnName('population'), value: country.population.textDecimalDigit),
      ]);
    }).toList(growable: false);
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {

    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;

    if (startIndex < countryEntity.length) {
      if (endIndex > countryEntity.length) {
        endIndex = countryEntity.length;
      }

      paginatedDataSource = List.from(countryEntity.getRange(startIndex, endIndex).toList(growable: false));
      buildPaginatedDataGridRows();
    } else {
      paginatedDataSource = [];
    }
    notifyListeners();
    return true;
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = gridRows.indexOf(row);
    Color backgroundColor = AppColors.rowTable;
    if ((rowIndex % 2) == 0) {
      backgroundColor = AppColors.white;
    }

    return DataGridRowAdapter(
      color: backgroundColor,
      cells: <Widget>[
        RowTableBasic(tableType: TableType.text, value: row.getCells()[0].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[1].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.number, value: row.getCells()[5].value.toString()),
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

  String _getColumnName(String columnName) {
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
