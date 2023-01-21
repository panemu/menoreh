import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CategoryDataGridSource extends DataGridSource {
  CategoryDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
    currencySymbol = NumberFormat.simpleCurrency(locale: 'id', name: 'Rp').currencySymbol;
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<CategoryCardModel> orders = <CategoryCardModel>[];
  List<CategoryCardModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  String currencySymbol = '';
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((CategoryCardModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('description'), value: order.description),
          DataGridCell<String>(columnName: getColumnName('type'), value: order.type),
          DataGridCell<String>(columnName: getColumnName('status'), value: order.status),
          DataGridCell<int>(columnName: getColumnName('amount'), value: order.amount),
          DataGridCell<int>(columnName: getColumnName('playMin'), value: order.playMin),
          DataGridCell<int>(columnName: getColumnName('playMax'), value: order.playMax),
          DataGridCell<double>(columnName: getColumnName('price'), value: order.price),
          DataGridCell<List<String>>(columnName: getColumnName('tags'), value: order.tags),
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
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.blue, value: row.getCells()[3].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.purple, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.number, value: row.getCells()[5].value.toString()),
        RowTableBasic(tableType: TableType.number, value: row.getCells()[6].value.toString()),
        RowTableBasic(tableType: TableType.number, value: row.getCells()[7].value.toString()),
        RowTableBasic(
          tableType: TableType.number,
          value: NumberFormat.currency(symbol: currencySymbol).format(row.getCells()[8].value),
        ),
        RowTableBasic(tableType: TableType.text, value: (row.getCells()[9].value as List).join(', ').toString()),
        RowTableAction(
          actions: [
            IconTable(
              onPressed: () {},
              icon: const Icon(Icons.attach_file_outlined),
              color: AppColors.blue,
            ),
          ],
        ),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[11].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[12].value.toString()),
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

  final List<String> _name = <String>[
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

  final List<String> _tags = <String>[
    'Umum',
    'Lawan jenis',
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
  List<CategoryCardModel> getOrders(List<CategoryCardModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0;
    final int endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(CategoryCardModel(
        id: 1 + i,
        name: _name[i < _name.length ? i : _random.nextInt(_name.length - 1)],
        description: _contents[i < _contents.length ? i : _random.nextInt(_contents.length - 1)],
        type: _type[i < _type.length ? i : _random.nextInt(_type.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        amount: _random.nextInt(1000) + _random.nextInt(10),
        tags: _tags,
        price: 1500.0 + _random.nextInt(100),
        playMin: _random.nextInt(4) + _random.nextInt(12),
        playMax: _random.nextInt(10) + _random.nextInt(2),
        tglDibuat: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        tglDiubah: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        image: '',
      ));
    }
    return orderData;
  }
}

class CategoryCardModel {
  final int id;
  final String name;
  final String description;
  final String type;
  final String status;
  final int amount;
  final int playMin;
  final int playMax;
  final double price;
  final List<String> tags;
  final String image;
  final String tglDibuat;
  final String tglDiubah;

  CategoryCardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.status,
    required this.amount,
    required this.playMin,
    required this.playMax,
    required this.price,
    required this.tags,
    required this.image,
    required this.tglDibuat,
    required this.tglDiubah,
  });
}
