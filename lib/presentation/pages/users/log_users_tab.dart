import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LogUsersTab extends StatefulWidget {
  const LogUsersTab({Key? key}) : super(key: key);

  @override
  State<LogUsersTab> createState() => _LogUsersTabState();
}

class _LogUsersTabState extends State<LogUsersTab> {
  final int _rowsPerPage = 15;
  late LogUsersDataGridSource logUsersDataSource;

  @override
  void initState() {
    super.initState();
    logUsersDataSource = LogUsersDataGridSource(orderDataCount: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyAction(
          onSearch: (value) {},
          onFilter: () => AppDialog.filter<bool>(
            context: context,
            title: 'Filter log user',
            content: const LogUsersFilterForm(),
            onSubmitted: () {},
            onReset: () {},
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export log user',
            description: 'Unduh atau export ke file dokumen excel.',
            // submitted: 'Export',
            // onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: logUsersDataSource,
            rowsPerPage: _rowsPerPage,
            columnWidthMode: ColumnWidthMode.auto,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = logUsersDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = logUsersDataSource.dataGridRows.indexOf(row);

                AppDialog.detail(
                  context: context,
                  title: 'Detail Log',
                  heightReduce: AppDimens.size6X * 2,
                  imageUrl: AppImages.avatarUrl,
                  content: [
                    const ListRowBasic(label: 'User', value: 'Esther Howard'),
                    const ListRowBasic(label: 'Kondisi', value: 'LOGOUT'),
                    const ListRowBasic(label: 'Tipe Perangkat', value: 'IOS'),
                    const ListRowBasic(label: 'Address IP', value: '117.20.48.97'),
                    const ListRowChip(label: 'Metode', value: 'Google', colorClip: AppColors.red),
                    const ListRowChip(label: 'Role', value: 'Admin', colorClip: AppColors.green),
                    ListRowBasic(label: 'Tanggal', value: 1651538822143.formMillisecondsSinceEpoch),
                  ],
                );
              }
            },
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'name', value: 'User'),
              ColumnTableText(context: context, columnName: 'condition', value: 'Kondisi'),
              ColumnTableText(context: context, columnName: 'typeDevice', value: 'Tipe Perangkat'),
              ColumnTableText(context: context, columnName: 'addressIp', value: 'Address IP'),
              ColumnTableText(context: context, columnName: 'method', value: 'Metode', width: AppDimens.size2X * 2),
              ColumnTableText(context: context, columnName: 'role', value: 'Role', width: AppDimens.size2X * 2),
              ColumnTableText(context: context, columnName: 'tgl', value: 'Tanggal', width: AppDimens.size2X * 2),
            ],
          ),
        ),
        PagingTable(
          source: logUsersDataSource,
          pageCount: logUsersDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}
