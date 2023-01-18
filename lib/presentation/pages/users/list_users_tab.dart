import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ListUsersTab extends StatefulWidget {
  const ListUsersTab({Key? key}) : super(key: key);

  @override
  State<ListUsersTab> createState() => _ListUsersTabState();
}

class _ListUsersTabState extends State<ListUsersTab> {
  final int _rowsPerPage = 15;
  late ListUsersDataGridSource listUsersDataSource;

  @override
  void initState() {
    super.initState();
    listUsersDataSource = ListUsersDataGridSource(orderDataCount: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyCard(
          contents: [
            ContentSidebarBodyCard(
              icon: Icons.people_alt_outlined,
              title: 'Total Semua',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.admin_panel_settings_outlined,
              title: 'Total Admin',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.person_search_outlined,
              title: 'Total Manager',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.person_outlined,
              title: 'Total User',
              value: '40.000',
            ),
          ],
        ),
        Divider(height: AppDimens.sizeZero),
        SidebarBodyAction(
          onSearch: (value) {},
          onFilter: () => AppDialog.filter<bool>(
            context: context,
            heightReduce: AppDimens.size8X,
            title: 'Filter daftar user',
            content: const ListUsersFilterForm(),
            onSubmitted: () {},
            onReset: () {},
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export daftar user',
            description: 'Unduh atau export ke file dokumen excel.',
            // submitted: 'Export',
            // onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: listUsersDataSource,
            rowsPerPage: _rowsPerPage,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = listUsersDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = listUsersDataSource.dataGridRows.indexOf(row);

                AppDialog.detail(
                  context: context,
                  title: 'Detail user',
                  heightReduce: AppDimens.sizeXL,
                  imageUrl: AppImages.avatarUrl,
                  content: [
                    const ListRowBasic(label: 'Nama', value: 'Nanang prasetya'),
                    const ListRowBasic(label: 'Email', value: 'nanang@mail.com'),
                    const ListRowBasic(label: 'UUID', value: 'vP7BDuLD'),
                    const ListRowBasic(label: 'Paket', value: 'FREE'),
                    const ListRowChip(label: 'Role', value: 'Admin', colorClip: AppColors.purple),
                    const ListRowChip(label: 'Metode', value: 'Google', colorClip: AppColors.red),
                    const ListRowChip(label: 'Status', value: 'Aktif', colorClip: AppColors.green),
                    ListRowBasic(label: 'Tgl dibuat', value: 1651538822143.formMillisecondsSinceEpoch),
                    ListRowBasic(label: 'Tgl diubah', value: 1651538822143.formMillisecondsSinceEpoch),
                  ],
                  editText: 'Ubah user',
                  editColor: AppColors.orange,
                  onEdit: () => AppDialog.form(
                    context: context,
                    title: 'Ubah user',
                    heightReduce: AppDimens.size7X * 2,
                    content: Column(
                      children: [
                        const TextFieldDropdown(
                          title: 'Role',
                          selectedItem: 'Manager',
                          items: ['Admin', 'Manager', 'User'],
                        ),
                        SizedBox(height: AppDimens.size4M),
                        TextFieldDropdownSearch<String>(
                          onChanged: (String? value) {},
                          title: 'Paket',
                          selectedItem: 'FREE',
                          itemAsString: (element) => element.toString(),
                          compareFn: (selected, val) => val == null ? false : selected == val,
                          items: const ['FREE', 'KENCAN', 'TEMAN', 'NONGKRONG', 'KELUARGA'],
                        ),
                        SizedBox(height: AppDimens.size4M),
                        const TextFieldDropdown(
                          title: 'Status',
                          selectedItem: 'Aktif',
                          items: ['Aktif', 'Tidak aktif'],
                        ),
                      ],
                    ),
                    onSubmitted: () {},
                  ),
                );
              }
            },
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'name', value: 'Nama'),
              ColumnTableText(context: context, columnName: 'email', value: 'Email', width: double.nan),
              ColumnTableText(context: context, columnName: 'uuid', value: 'UUID', width: double.nan),
              ColumnTableText(context: context, columnName: 'package', value: 'Paket', width: double.nan),
              ColumnTableText(context: context, columnName: 'method', value: 'Metode', width: double.nan),
              ColumnTableText(context: context, columnName: 'role', value: 'Role', width: double.nan),
              ColumnTableText(context: context, columnName: 'status', value: 'Status', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDibuat', value: 'Tgl dibuat', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDiubah', value: 'Tgl diubah', width: double.nan),
            ],
          ),
        ),
        PagingTable(
          source: listUsersDataSource,
          pageCount: listUsersDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}
