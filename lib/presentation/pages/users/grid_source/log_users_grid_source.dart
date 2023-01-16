import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LogUsersDataGridSource extends DataGridSource {
  LogUsersDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<LogUsersModel> orders = <LogUsersModel>[];
  List<LogUsersModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((LogUsersModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('image'), value: order.image),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('condition'), value: order.condition),
          DataGridCell<String>(columnName: getColumnName('typeDevice'), value: order.typeDevice),
          DataGridCell<String>(columnName: getColumnName('addressIp'), value: order.addressIp),
          DataGridCell<String>(columnName: getColumnName('method'), value: order.method),
          DataGridCell<String>(columnName: getColumnName('role'), value: order.role),
          DataGridCell<String>(columnName: getColumnName('tgl'), value: order.tgl),
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
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.red, value: row.getCells()[6].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.purple, value: row.getCells()[7].value.toString()),
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

  final List<String> _type = <String>[
    'IOS',
    'ANDROID',
    'WEBSITE',
  ];

  final List<String> _addressIp = <String>[
    '117.20.48.97',
    '172.70.62.138',
    '192.10.2.1',
  ];

  final List<String> _method = <String>[
    'Google',
    'Facebook',
    'Password',
  ];

  final List<String> _role = <String>[
    'Admin',
    'Member',
    'Pemain',
  ];

  final List<String> _condition = <String>[
    'LOGOUT',
    'LOGIN',
  ];

  final List<String> _date = <String>[
    '26 Oct-2020, 00:00',
    '19 Apr 2021, 00:00',
    '27 Jun 2021, 00:00',
    '17 Oct 2021, 00:00',
  ];

  List<LogUsersModel> getOrders(List<LogUsersModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(LogUsersModel(
        id: 1 + i,
        name: _names[i < _names.length ? i : _random.nextInt(_names.length - 1)],
        image: _images[i < _images.length ? i : _random.nextInt(_images.length - 1)],
        typeDevice: _type[i < _type.length ? i : _random.nextInt(_type.length - 1)],
        addressIp: _addressIp[i < _addressIp.length ? i : _random.nextInt(_addressIp.length - 1)],
        condition: _condition[i < _condition.length ? i : _random.nextInt(_condition.length - 1)],
        role: _role[i < _role.length ? i : _random.nextInt(_role.length - 1)],
        method: _method[i < _method.length ? i : _random.nextInt(_method.length - 1)],
        tgl: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
      ));
    }
    return orderData;
  }
}

class LogUsersModel {
  final int id;
  final String image;
  final String name;
  final String condition;
  final String typeDevice;
  final String addressIp;
  final String method;
  final String role;
  final String tgl;

  LogUsersModel({
    required this.id,
    required this.image,
    required this.name,
    required this.condition,
    required this.typeDevice,
    required this.addressIp,
    required this.method,
    required this.role,
    required this.tgl,
  });
}
