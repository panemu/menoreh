import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class HistoryPaymentTab extends StatefulWidget {
  const HistoryPaymentTab({Key? key}) : super(key: key);

  @override
  State<HistoryPaymentTab> createState() => _HistoryPaymentTabState();
}

class _HistoryPaymentTabState extends State<HistoryPaymentTab> {
  final int _rowsPerPage = 15;
  late HitoryPaymentDataGridSource hitoryPaymentDataSource;

  @override
  void initState() {
    super.initState();
    hitoryPaymentDataSource = HitoryPaymentDataGridSource(orderDataCount: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyCard(
          contents: [
            ContentSidebarBodyCard(
              icon: Icons.leaderboard_outlined,
              title: 'Paket Dibeli',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.sync_outlined,
              title: 'Paket Aktif',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.sync_disabled_outlined,
              title: 'Paket Kadaluarsa',
              value: '40.000',
            ),
          ],
        ),
        Divider(height: AppDimens.sizeZero),
        SidebarBodyAction(
          searchReceptacle: SerachReceptacle(onSearch: (value) {}),
          // filterReceptacle: FilterReceptacle(
          //   onFilter: () => AppDialog.filter<bool>(
          //     context: context,
          //     title: 'Filter paket',
          //     heightReduce: AppDimens.size8X,
          //     content: const HistoryPaymentFilterForm(),
          //     onSubmitted: () {},
          //     onReset: () {},
          //   ),
          // ),
          dropdownButton: DateRangeButton<String>(
            items: const ['Minggu ini', 'Bulan ini', 'Tahun ini'],
            onChanged: (value) {},
            selectedItem: 'Bulan ini',
          ),
          onExport: () => AppDialog.confirm(
            context: context,
            title: 'Export daftar pembayaran',
            description: 'Unduh atau export ke file dokumen excel.',
            // submitted: 'Export',
            // onSubmitted: () {},
          ),
        ),
        Expanded(
          child: MainTable(
            source: hitoryPaymentDataSource,
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
              ColumnTableText(context: context, columnName: 'packageName', value: 'Nama paket', width: double.nan),
              ColumnTableText(context: context, columnName: 'dateBuy', value: 'Tgl pembayaran', width: double.nan),
              ColumnTableText(context: context, columnName: 'dateExp', value: 'Tgl kadaluarsa', width: double.nan),
              ColumnTableNumber(context: context, columnName: 'price', value: 'Harga'),
              ColumnTableText(
                  context: context,
                  columnName: 'statusPayment',
                  value: 'Status pembayaran',
                  width: AppDimens.size4X * 2),
              ColumnTableText(
                  context: context,
                  columnName: 'methodPayment',
                  value: 'Metode pembayaran',
                  width: AppDimens.size4X * 2),
              ColumnTableText(context: context, columnName: 'status', value: 'Status', width: AppDimens.size2X * 2),
            ],
          ),
        ),
        PagingTable(
          source: hitoryPaymentDataSource,
          pageCount: hitoryPaymentDataSource.orders.length / _rowsPerPage,
        ),
      ],
    );
  }
}
