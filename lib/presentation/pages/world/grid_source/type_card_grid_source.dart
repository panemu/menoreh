import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class TypeDataGridSource extends DataGridSource {
  TypeDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<TypeCardModel> orders = <TypeCardModel>[];
  List<TypeCardModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((TypeCardModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('description'), value: order.description),
          DataGridCell<String>(columnName: getColumnName('status'), value: order.status),
          DataGridCell<String>(columnName: getColumnName('amountCategory'), value: order.amountCategory),
          DataGridCell<List<String>>(columnName: getColumnName('goal'), value: order.goal),
          DataGridCell<List<String>>(columnName: getColumnName('step'), value: order.step),
          DataGridCell<List<String>>(columnName: getColumnName('snk'), value: order.snk),
          DataGridCell<List<String>>(columnName: getColumnName('tags'), value: order.tags),
          DataGridCell<String>(columnName: getColumnName('linkHelp'), value: order.linkHelp),
          DataGridCell<String>(columnName: getColumnName('linkVideo'), value: order.linkVideo),
          DataGridCell<String>(columnName: getColumnName('image'), value: order.image),
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
        RowTableBasic(tableType: TableType.text, value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.green, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.text, value: (row.getCells()[5].value as List).join(', ').toString()),
        RowTableBasic(tableType: TableType.text, value: (row.getCells()[6].value as List).join(', ').toString()),
        RowTableBasic(tableType: TableType.text, value: (row.getCells()[7].value as List).join(', ').toString()),
        RowTableBasic(tableType: TableType.text, value: (row.getCells()[8].value as List).join(', ').toString()),
        RowTableAction(
          actions: [
            IconTable(
              onPressed: () {},
              icon: const Icon(Icons.link),
              color: AppColors.blue,
            ),
          ],
        ),
        RowTableAction(
          actions: [
            IconTable(
              onPressed: () {},
              icon: const Icon(Icons.link),
              color: AppColors.blue,
            ),
          ],
        ),
        RowTableAction(
          actions: [
            IconTable(
              onPressed: () {},
              icon: const Icon(Icons.attach_file_outlined),
              color: AppColors.blue,
            ),
          ],
        ),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[12].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[13].value.toString()),
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

  final List<String> _type = <String>[
    'Tebak Gambar',
    'Truth or Dare',
    'Tebak Kata',
    'Rasa Karsa',
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

  /// Get orders collection
  List<TypeCardModel> getOrders(List<TypeCardModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(TypeCardModel(
        id: 1 + i,
        name: _type[i < _type.length ? i : _random.nextInt(_type.length - 1)],
        description: _contents[i < _contents.length ? i : _random.nextInt(_contents.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        amountCategory: '${_random.nextInt(4) + _random.nextInt(12)} category',
        tags: [],
        goal: [],
        snk: [],
        step: [],
        linkHelp: '',
        linkVideo: '',
        image: '',
        tglDibuat: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        tglDiubah: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
      ));
    }
    return orderData;
  }
}

class TypeCardModel {
  final int id;
  final String name;
  final String description;
  final String status;
  final String amountCategory;
  final List<String> goal;
  final List<String> step;
  final List<String> snk;
  final List<String> tags;
  final String tglDibuat;
  final String tglDiubah;
  final String linkHelp;
  final String linkVideo;
  final String image;

  TypeCardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.amountCategory,
    required this.goal,
    required this.step,
    required this.snk,
    required this.tags,
    required this.tglDibuat,
    required this.tglDiubah,
    required this.linkHelp,
    required this.linkVideo,
    required this.image,
  });
}
