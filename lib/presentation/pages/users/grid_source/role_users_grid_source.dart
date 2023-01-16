import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class RoleUsersDataGridSource extends DataGridSource {
  /// Creates the order data source class with required details.
  RoleUsersDataGridSource({this.orderDataCount, this.ordersCollection, bool? isFilteringSample}) {
    this.isFilteringSample = isFilteringSample ?? false;
    orders = ordersCollection ?? getOrders(orders, orderDataCount ?? 100);
  }

  int? orderDataCount;
  final math.Random _random = math.Random();
  List<RoleUsersModel> orders = <RoleUsersModel>[];
  List<RoleUsersModel>? ordersCollection;
  List<DataGridRow> dataGridRows = <DataGridRow>[];
  late bool isFilteringSample;

  @override
  List<DataGridRow> get rows => orders.map<DataGridRow>((RoleUsersModel order) {
        return DataGridRow(cells: <DataGridCell>[
          DataGridCell<int>(columnName: getColumnName('id'), value: order.id),
          DataGridCell<String>(columnName: getColumnName('role'), value: order.role),
          DataGridCell<String>(columnName: getColumnName('desc'), value: order.desc),
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
        RowTableBasic(tableType: TableType.text, value: row.getCells()[1].value.toString()),
        RowTableBasic(tableType: TableType.text, value: row.getCells()[2].value.toString()),
        RowTableBasic(tableType: TableType.chip, chipColor: AppColors.green, value: row.getCells()[3].value.toString()),
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

  final List<String> _role = <String>[
    'Admin',
    'Member',
    'Pemain',
  ];

  final List<String> _desc = <String>[
    'Phasellus consectetur facilisis',
    'Consectetur facilisis',
    'Facilisis phasellus consectetur',
  ];

  final List<String> _status = <String>[
    'Aktif',
    'Tidak Aktif',
  ];

  List<RoleUsersModel> getOrders(List<RoleUsersModel> orderData, int count, {String? culture}) {
    final int startIndex = orderData.isNotEmpty ? orderData.length : 0, endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      orderData.add(RoleUsersModel(
        id: 1 + i,
        role: _role[i < _role.length ? i : _random.nextInt(_role.length - 1)],
        status: _status[i < _status.length ? i : _random.nextInt(_status.length - 1)],
        desc: _desc[i < _desc.length ? i : _random.nextInt(_desc.length - 1)],
      ));
    }
    return orderData;
  }
}

class RoleUsersModel {
  final int id;
  final String role;
  final String desc;
  final String status;

  RoleUsersModel({
    required this.id,
    required this.role,
    required this.desc,
    required this.status,
  });
}
