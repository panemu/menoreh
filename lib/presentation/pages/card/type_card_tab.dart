import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class TypeCardTab extends StatefulWidget {
  const TypeCardTab({Key? key}) : super(key: key);

  @override
  State<TypeCardTab> createState() => _TypeCardTabState();
}

class _TypeCardTabState extends State<TypeCardTab> {
  final int _rowsPerPage = 15;
  late TypeDataGridSource typeDataSource;

  @override
  void initState() {
    super.initState();
    typeDataSource = TypeDataGridSource(orderDataCount: 300);
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
          onSearch: (value) {},
          onAdd: () => AppDialog.form(
            context: context,
            title: 'Tambah Tipe',
            content: const TypeCardAddForm(),
            onSubmitted: () {},
          ),
          onFilter: () => AppDialog.filter<bool>(
            context: context,
            heightReduce: AppDimens.size8X * 2,
            title: 'Filter daftar tipe',
            content: const TypeCardFilterForm(),
            onSubmitted: () {},
            onReset: () {},
          ),
          onImport: () => AppDialog.import(
            context: context,
            title: 'Import tipe',
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
            title: 'Export daftar tipe',
            description: 'Unduh atau export ke file dokumen excel.',
            submitted: 'Export',
            onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: typeDataSource,
            rowsPerPage: _rowsPerPage,
            onCellTap: (DataGridCellTapDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                // final DataGridRow row = cardDataSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                // int index = cardDataSource.dataGridRows.indexOf(row);

                AppDialog.detail(
                  context: context,
                  title: 'Detail tipe',
                  imageUrl: AppImages.avatarUrl,
                  content: [
                    const ListRowBasic(label: 'Nama', value: 'Rasa karsa'),
                    const ListRowBasic(label: 'Jumlah kategori', value: '20 kategori'),
                    const ListRowChip(label: 'Status', value: 'Aktif', colorClip: AppColors.green),
                    const ListRowBasic(
                      label: 'Deskripsi',
                      value: 'Phasellus consectetur facilisis',
                      multiLine: true,
                    ),
                    ListRowLink(label: 'Tujuan permainan', onClick: () {}),
                    ListRowLink(label: 'Cara bermain', onClick: () {}),
                    ListRowLink(label: 'Syarat & ketentuan', onClick: () {}),
                    ListRowLink(label: 'Link bantuan', onClick: () {}),
                    ListRowLink(label: 'Link video', onClick: () {}),
                    const ListRowBasic(label: 'Tags', value: 'Umum, Lawan jenis'),
                    ListRowBasic(label: 'Tgl dibuat', value: 1651538822143.formMillisecondsSinceEpoch),
                    ListRowBasic(label: 'Tgl diubah', value: 1651538822143.formMillisecondsSinceEpoch),
                  ],
                  onDelete: () => AppDialog.confirm(
                    context: context,
                    title: 'Hapus tipe',
                    description: 'Apakah anda yakin ingin menghapus tipe ini?',
                    submittedColor: AppColors.red,
                    submitted: 'Hapus',
                    onSubmitted: () {},
                  ),
                  onEdit: () {},
                );
              }
            },
            columnWidthMode: ColumnWidthMode.none,
            columns: <GridColumn>[
              ColumnTableId(context: context, value: 'ID'),
              ColumnTableText(context: context, columnName: 'name', value: 'Nama'),
              ColumnTableText(context: context, columnName: 'description', value: 'Deskripsi'),
              ColumnTableText(context: context, columnName: 'status', value: 'Status'),
              ColumnTableText(context: context, columnName: 'amountCategory', value: 'Jumlah Kategori'),
              ColumnTableText(context: context, columnName: 'goal', value: 'Tujuan Permainan', width: double.nan),
              ColumnTableText(context: context, columnName: 'step', value: 'Cara Bermain', width: double.nan),
              ColumnTableText(context: context, columnName: 'snk', value: 'Syarat dan Ketentuan', width: double.nan),
              ColumnTableText(context: context, columnName: 'tags', value: 'Tags', width: double.nan),
              ColumnTableAction(context: context, columnName: 'linkHelp', value: 'Link Bantuan', width: double.nan),
              ColumnTableAction(context: context, columnName: 'linkVideo', value: 'Link Video', width: double.nan),
              ColumnTableAction(context: context, columnName: 'image', value: 'Gambar', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDibuat', value: 'Tgl dibuat', width: double.nan),
              ColumnTableText(context: context, columnName: 'tglDiubah', value: 'Tgl diubah', width: double.nan),
            ],
          ),
        ),
        PagingTable(
          source: typeDataSource,
          pageCount: typeDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}