import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class RoleUsersTab extends StatefulWidget {
  const RoleUsersTab({Key? key}) : super(key: key);

  @override
  State<RoleUsersTab> createState() => _RoleUsersTabState();
}

class _RoleUsersTabState extends State<RoleUsersTab> {
  final int _rowsPerPage = 15;
  late RoleUsersDataGridSource roleUsersDataSource;

  @override
  void initState() {
    super.initState();
    roleUsersDataSource = RoleUsersDataGridSource(orderDataCount: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyAction(
          title: 'Daftar Role Permission',
          onAdd: () => AppDialog.form(
            context: context,
            title: 'Tambah role',
            heightReduce: AppDimens.size4X * 2,
            content: const RoleUsersAddForm(),
            onSubmitted: () {},
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export role',
            description: 'Unduh atau export ke file dokumen excel.',
            submitted: 'Export',
            onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: roleUsersDataSource,
            rowsPerPage: _rowsPerPage,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = roleUsersDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = roleUsersDataSource.dataGridRows.indexOf(row);

                AppDialog.detail(
                  context: context,
                  title: 'Detail Role',
                  heightReduce: AppDimens.size4X * 4,
                  content: [
                    const ListRowBasic(label: 'Nama Role', value: 'ADMIN'),
                    const ListRowBasic(label: 'Deskripsi', value: 'Phasellus consectetur facilisis', multiLine: true),
                    const ListRowChip(label: 'Status', value: 'Aktif', colorClip: AppColors.green),
                  ],
                  editColor: AppColors.orange,
                  onEdit: () => AppDialog.confirm(
                    context: context,
                    title: 'Status user',
                    description: 'Ubah status dari role <ADMIN> ini',
                    content: const TextFieldDropdown(
                      selectedItem: 'Aktif',
                      items: ['Aktif', 'Tidak aktif'],
                    ),
                  ),
                );
              }
            },
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'role', value: 'Nama Role'),
              ColumnTableText(context: context, columnName: 'desc', value: 'Deskripsi'),
              ColumnTableText(context: context, columnName: 'status', value: 'Status'),
            ],
          ),
        ),
        PagingTable(
          source: roleUsersDataSource,
          pageCount: roleUsersDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}
