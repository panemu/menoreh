import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ListUsersDataGridSource extends DataGridSource {
  ListUsersDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<UsersModel> orders = <UsersModel>[];
  List<UsersModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((UsersModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('image'), value: order.image),
          DataGridCell<String>(columnName: getColumnName('name'), value: order.name),
          DataGridCell<String>(columnName: getColumnName('email'), value: order.email),
          DataGridCell<String>(columnName: getColumnName('uuid'), value: order.uuid),
          DataGridCell<String>(columnName: getColumnName('package'), value: order.package),
          DataGridCell<String>(columnName: getColumnName('method'), value: order.method),
          DataGridCell<String>(columnName: getColumnName('role'), value: order.role),
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
        RowTableUser(avatarUrl: row.getCells()[1].value.toString(), value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[3].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[4].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[5].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.red, value: row.getCells()[6].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.tial, value: row.getCells()[7].value.toString()),
        RowTableBasic(
            tableType: TableType.chip, chipColor: AppColors.purple, value: row.getCells()[8].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[9].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[10].value.toString()),
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

  final List<String> _email = <String>[
    'skippy@yahoo.com',
    'ahuillet@live.com',
    'farber@comcast.net',
    'schumer@msn.com',
    'boein@hotmail.com',
  ];

  final List<String> _uuid = <String>[
    'vP7BDuLD',
    'pMhbL5dn',
    'ffjnA7De',
    'd9XCTKWV',
  ];

  final List<String> _packages = <String>[
    'FREE',
    'KENCAN',
    'TEMAN',
    'NONGKRONG',
    'KELUARGA',
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

  List<UsersModel> getOrders(List<UsersModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(UsersModel(
        id: 1 + i,
        name: _names[i < _names.length ? i : _random.nextInt(_names.length - 1)],
        image: _images[i < _images.length ? i : _random.nextInt(_images.length - 1)],
        email: _email[i < _email.length ? i : _random.nextInt(_email.length - 1)],
        uuid: _uuid[i < _uuid.length ? i : _random.nextInt(_uuid.length - 1)],
        package: _packages[i < _packages.length ? i : _random.nextInt(_packages.length - 1)],
        role: _role[i < _role.length ? i : _random.nextInt(_role.length - 1)],
        method: _method[i < _method.length ? i : _random.nextInt(_method.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        tglDibuat: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
        tglDiubah: _date[i < _date.length ? i : _random.nextInt(_date.length - 1)],
      ));
    }
    return orderData;
  }
}

class UsersModel {
  final int id;
  final String name;
  final String image;
  final String email;
  final String uuid;
  final String package;
  final String method;
  final String role;
  final String status;
  final String tglDibuat;
  final String tglDiubah;

  UsersModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.uuid,
    required this.package,
    required this.method,
    required this.role,
    required this.status,
    required this.tglDibuat,
    required this.tglDiubah,
  });
}
