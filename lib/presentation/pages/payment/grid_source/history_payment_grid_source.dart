import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class HitoryPaymentDataGridSource extends DataGridSource {
  HitoryPaymentDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
    currencySymbol = NumberFormat.simpleCurrency(locale: 'id', name: 'Rp').currencySymbol;
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<HistoryPaymentModel> orders = <HistoryPaymentModel>[];
  List<HistoryPaymentModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  String currencySymbol = '';
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((HistoryPaymentModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('image'), value: order.image),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('packageName'), value: order.packageName),
          DataGridCell<String>(columnName: getColumnName('dateBuy'), value: order.dateBuy),
          DataGridCell<String>(columnName: getColumnName('dateExp'), value: order.dateExp),
          DataGridCell<String>(columnName: getColumnName('price'), value: order.price),
          DataGridCell<String>(columnName: getColumnName('statusPayment'), value: order.statusPayment),
          DataGridCell<String>(columnName: getColumnName('methodPayment'), value: order.methodPayment),
          DataGridCell<String>(columnName: getColumnName('status'), value: order.status),
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
        RowTableUser(avatarUrl: row.getCells()[1].value.toString(), value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[5].value.toString()),
        RowTableBasic(tableType: TableType.number, value: row.getCells()[6].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.orange, value: row.getCells()[7].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.purple, value: row.getCells()[8].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.green, value: row.getCells()[9].value.toString()),
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
    'Crowley',
    'Blonp',
    'Folko',
    'Irvine',
    'Folig',
    'Picco',
    'Frans',
    'Warth',
    'Linod',
    'Simop',
    'Merep',
    'Riscu',
    'Seves',
    'Vaffe',
    'Alfki',
  ];

  final List<String> _images = <String>[
    'https://images.squarespace-cdn.com/content/v1/5eb48d3fef49df153d320521/247e27d8-90d3-4d0d-b2bc-69eae58b3083/PirateToyFace.jpg?format=1000w',
    'https://images.squarespace-cdn.com/content/v1/5eb48d3fef49df153d320521/e803ff5f-a92a-47e7-b007-1c7d1d277f62/Bowie_ToyFace.jpg?format=1000w',
    'https://images.squarespace-cdn.com/content/v1/5eb48d3fef49df153d320521/1618034873351-FHER4ELQXCQ3SUIOO2SU/Daft+Punk+Toy+Face+II+.jpg?format=1000wt',
    'https://images.squarespace-cdn.com/content/v1/5eb48d3fef49df153d320521/bf88af75-6233-420a-b172-1ff6e047b4af/Punk4892ToyFace-3.jpg?format=1000w',
    'https://images.squarespace-cdn.com/content/v1/5eb48d3fef49df153d320521/1618032621049-K4MEFQ6TQL3MIBYSZGPG/Malala+Toy+Face.jpg?format=1000w',
  ];

  final List<String> _packages = <String>[
    'FREE',
    'KENCAN',
    'TEMAN',
    'NONGKRONG',
    'KELUARGA',
  ];

  final List<String> _methodPayment = <String>[
    'IAP',
    'TOKEN',
  ];

  final List<String> _statusPayment = <String>[
    'Terbayar',
    'Pending',
    'Gagal',
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

  List<HistoryPaymentModel> getOrders(List<HistoryPaymentModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(HistoryPaymentModel(
        id: 1 + i,
        name: _names[i < _names.length ? i : _random.nextInt(_names.length - 1)],
        image: _images[i < _images.length ? i : _random.nextInt(_images.length - 1)],
        packageName: _packages[i < _packages.length ? i : _random.nextInt(_packages.length - 1)],
        dateBuy: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        dateExp: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        price: '',
        statusPayment: _statusPayment[i < _statusPayment.length ? i : _random.nextInt(_statusPayment.length - 1)],
        methodPayment: _methodPayment[i < _methodPayment.length ? i : _random.nextInt(_methodPayment.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
      ));
    }
    return orderData;
  }
}

class HistoryPaymentModel {
  final int id;
  final String name;
  final String image;
  final String packageName;
  final String dateBuy;
  final String dateExp;
  final String price;
  final String statusPayment;
  final String methodPayment;
  final String status;

  HistoryPaymentModel({
    required this.id,
    required this.name,
    required this.image,
    required this.packageName,
    required this.dateBuy,
    required this.dateExp,
    required this.price,
    required this.statusPayment,
    required this.methodPayment,
    required this.status,
  });
}
