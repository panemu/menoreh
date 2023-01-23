import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ManagePackagesTab extends StatefulWidget {
  const ManagePackagesTab({Key? key}) : super(key: key);

  @override
  State<ManagePackagesTab> createState() => _ManagePackagesTabState();
}

class _ManagePackagesTabState extends State<ManagePackagesTab> {
  final int _rowsPerPage = 15;
  late ManagePackageDataGridSource managePackageDataSource;

  @override
  void initState() {
    super.initState();
    managePackageDataSource = ManagePackageDataGridSource(orderDataCount: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SidebarBodyAction(
          onSearch: (value) {},
          onFilter: () => AppDialog.filter<bool>(
            context: context,
            title: 'Filter paket',
            content: const ManagePackageFilterForm(),
            onSubmitted: () {},
            onReset: () {},
          ),
          onAdd: () => AppDialog.form(
            context: context,
            title: 'Tambah paket',
            content: const ManagePackageAddForm(),
            // onSubmitted: () {},
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export daftar paket',
            description: 'Unduh atau export ke file dokumen excel.',
            // submitted: 'Export',
            // onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: managePackageDataSource,
            rowsPerPage: _rowsPerPage,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = cardDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = cardDataSource.dataGridRows.indexOf(row);

                
              }
            },
            columnWidthMode: ColumnWidthMode.auto,
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'name', value: 'Nama'),
              ColumnTableText(context: context, columnName: 'activePeriod', value: 'Masa aktif', width: double.nan),
              ColumnTableText(context: context, columnName: 'listFitur', value: 'Daftar fitur', width: double.nan),
              ColumnTableText(context: context, columnName: 'description', value: 'Deskripsi'),
              ColumnTableNumber(context: context, columnName: 'price', value: 'Harga'),
              ColumnTableText(context: context, columnName: 'status', value: 'Status', width: AppDimens.size2X * 2),
              ColumnTableText(context: context, columnName: 'tglDibuat', value: 'Tgl dibuat', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDiubah', value: 'Tgl diubah', width: double.nan),
            ],
          ),
        ),
        PagingTable(
          source: managePackageDataSource,
          pageCount: managePackageDataSource.orders.length / _rowsPerPage,

        ),
      ],
    );
  }
}