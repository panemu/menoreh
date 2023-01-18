import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CardDataGridSource extends DataGridSource {
  CardDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
    currencySymbol = NumberFormat.simpleCurrency().currencySymbol;
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<CardModel> orders = <CardModel>[];
  List<CardModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  String currencySymbol = '';
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((CardModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('content'), value: order.content),
          DataGridCell<String>(columnName: getColumnName('category'), value: order.category),
          DataGridCell<String>(columnName: getColumnName('type'), value: order.type),
          DataGridCell<String>(columnName: getColumnName('status'), value: order.status),
          DataGridCell<String>(columnName: getColumnName('highline'), value: order.highline),
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
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.tial, value: row.getCells()[2].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.purple, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.red, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.link, value: row.getCells()[5].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[6].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[7].value.toString()),
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

  final List<String> _contents = <String>[
    'Menurutkamu apa arti...',
    'Siapa orang yang menjadi...',
    'Siapa orang yang menjadi...',
    'Menurutkamu apa arti...',
  ];

  final List<String> _category = <String>[
    'Teman',
    'Perkenalan',
    'Keluarga',
    'Pacar',
    'Diri sendiri',
  ];

  final List<String> _type = <String>[
    'Tebak Gambar',
    'Truth or Dare',
    'Tebak Kata',
    'Rasa Karsa',
  ];

  final List<String> _highline = <String>[
    'Whatsapp',
    'Subang',
    'Healing',
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

  List<CardModel> getOrders(List<CardModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(CardModel(
        id: 1 + i,
        content: _contents[i < _contents.length ? i : _random.nextInt(_contents.length - 1)],
        category: _category[_random.nextInt(_category.length - 1)],
        type: _type[i < _type.length ? i : _random.nextInt(_type.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        highline: _highline[i < _highline.length ? i : _random.nextInt(_highline.length - 1)],
        tglDibuat: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        tglDiubah: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
      ));
    }
    return orderData;
  }
}

class CardModel {
  final int id;
  final String content;
  final String category;
  final String type;
  final String status;
  final String highline;
  final String tglDibuat;
  final String tglDiubah;

  CardModel({
    required this.id,
    required this.content,
    required this.category,
    required this.type,
    required this.status,
    required this.highline,
    required this.tglDibuat,
    required this.tglDiubah,
  });
}
