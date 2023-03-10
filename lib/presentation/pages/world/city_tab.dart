import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CityTab extends StatefulWidget {
  const CityTab({Key? key}) : super(key: key);

  @override
  State<CityTab> createState() => _CategoryCardTabState();
}

class _CategoryCardTabState extends State<CityTab> {
  final int _rowsPerPage = 15;
  late CategoryDataGridSource categoryDataSource;

  @override
  void initState() {
    super.initState();
    categoryDataSource = CategoryDataGridSource(orderDataCount: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyCard(
          contents: [
            ContentSidebarBodyCard(
              icon: Icons.view_carousel_outlined,
              title: 'Total Kartu',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.archive_outlined,
              title: 'Total Archive',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.category_outlined,
              title: 'Total Kategori',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.merge_type_outlined,
              title: 'Total Tipe',
              value: '40.000',
            ),
          ],
        ),
        Divider(height: AppDimens.sizeZero),
        SidebarBodyAction(
          searchReceptacle: SerachReceptacle(onSearch: (value) {}),
          onAdd: () => AppDialog.form(
            context: context,
            title: 'Tambah Kategori',
            content: const CityAddForm(),
          ),
          filterReceptacle: FilterReceptacle(
            onFilter: () {}
          ),
          onImport: () => AppDialog.import(
            context: context,
            title: 'Import kategori',
            description: 'Silahkan masukukan file Excel kamu ke sini. Juga pastikan data sesuai dengan template.',
            content: TextFieldPicker(
              fileType: FileType.media,
              onDone: (i) {},
            ),
            onSubmitted: () {},
            onDownload: () {},
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export daftar kategori',
            description: 'Unduh atau export ke file dokumen excel.',
            // submitted: 'Export',
            // onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: categoryDataSource,
            rowsPerPage: _rowsPerPage,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = cardDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = cardDataSource.dataGridRows.indexOf(row);

              }
            },
            columnWidthMode: ColumnWidthMode.none,
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'name', value: 'Nama'),
              ColumnTableText(context: context, columnName: 'description', value: 'Deskripsi'),
              ColumnTableText(context: context, columnName: 'type', value: 'Tipe'),
              ColumnTableText(context: context, columnName: 'status', value: 'Status'),
              ColumnTableNumber(context: context, columnName: 'amount', value: 'Jumlah Kartu', width: double.nan),
              ColumnTableNumber(context: context, columnName: 'playMin', value: 'Min pemain', width: double.nan),
              ColumnTableNumber(context: context, columnName: 'playMax', value: 'Max pemain', width: double.nan),
              ColumnTableNumber(context: context, columnName: 'price', value: 'Harga', width: double.nan),
              ColumnTableText(context: context, columnName: 'tags', value: 'Tags'),
              ColumnTableAction(context: context, columnName: 'image', value: 'Gambar', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDibuat', value: 'Tgl dibuat', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDiubah', value: 'Tgl diubah', width: double.nan),
            ],
          ),
        ),
        PagingTable(
          source: categoryDataSource,
          pageCount: categoryDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}
