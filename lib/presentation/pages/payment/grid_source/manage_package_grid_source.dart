import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ManagePackageDataGridSource extends DataGridSource {
  ManagePackageDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 10);
    currencySymbol = NumberFormat.simpleCurrency(locale: 'id', name: 'Rp').currencySymbol;
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<ManagePackageModel> orders = <ManagePackageModel>[];
  List<ManagePackageModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  String currencySymbol = '';
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((ManagePackageModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<int>(columnName: getColumnName('activePeriod'), value: order.activePeriod),
          DataGridCell<String>(columnName: getColumnName('listFitur'), value: order.listFitur),
          DataGridCell<String>(columnName: getColumnName('description'), value: order.description),
          DataGridCell<double>(columnName: getColumnName('price'), value: order.price),
          DataGridCell<String>(columnName: getColumnName('status'), value: order.status),
          DataGridCell<String>(columnName: getColumnName('tglDibuat'), value: order.tglDibuat),
          DataGridCell<String>(columnName: getColumnName('tglDiubah'), value: order.tglDiubah),
        ]);
      }).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = dataGridRows.indexOf(row);
    Color backgroundColor = AppColors.white;
    if ((rowIndex % 2) == 0) {
      backgroundColor = AppColors.grey.shade50;
    }

    return DataGridRowAdapter(
      color: backgroundColor,
      cells: <Widget>[
        RowTableBasic(tableType: TableType.text, value: row.getCells()[0].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[1].value.toString()),
        RowTableBasic(tableType: TableType.text, value: '${row.getCells()[2].value.toString()} Hari'),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(
          tableType: TableType.number,
          value: NumberFormat.currency(symbol: currencySymbol).format(row.getCells()[5].value),
        ),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.green, value: row.getCells()[6].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[7].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[8].value.toString()),
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

  /// Provides the column name.
  String getColumnName(String columnName) {
    if (isFilteringSample) {
      switch (columnName) {
        case 'id':
          return 'Order ID';
        case 'customerId':
          return 'Customer ID';
        case 'name':
          return 'Name';
        case 'freight':
          return 'Freight';
        case 'city':
          return 'City';
        case 'price':
          return 'Price';
        default:
          return columnName;
      }
    }
    return columnName;
  }

  final List<String> _names = <String>[
    'FREE',
    'KENCAN',
    'TEMAN',
    'NONGKRONG',
    'KELUARGA',
  ];

  final List<String> _desc = <String>[
    '-',
    '-',
  ];

  final List<String> _features = <String>[
    '4 User',
    'Penggilan suara',
    'Buat kartu',
  ];

  final List<String> _status = <String>[
    'Aktif',
    'Tidak Aktif',
  ];

  final List<String> _date = <String>[
    '26 Oct-2020, 00:00',
    '19 Apr 2021, 00:00',
    '27 Jun 2021, 00:00',
    '17 Oct 2021, 00:00',
  ];

  List<ManagePackageModel> getOrders(List<ManagePackageModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(ManagePackageModel(
        id: 1 + i,
        name: _names[i < _names.length ? i : _random.nextInt(_names.length - 1)],
        activePeriod: _random.nextInt(20) + _random.nextInt(12),
        listFitur: _features.join(', '),
        description: _desc[i < _desc.length ? i : _random.nextInt(_desc.length - 1)],
        price: 1500.0 + _random.nextInt(100),
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        tglDibuat: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        tglDiubah: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
      ));
    }
    return orderData;
  }
}

class ManagePackageModel {
  final int id;
  final String name;
  final int activePeriod;
  final String listFitur;
  final String description;
  final double price;
  final String status;
  final String tglDibuat;
  final String tglDiubah;

  ManagePackageModel({
    required this.id,
    required this.name,
    required this.activePeriod,
    required this.listFitur,
    required this.description,
    required this.price,
    required this.status,
    required this.tglDibuat,
    required this.tglDiubah,
  });
}
