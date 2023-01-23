import 'package:domain/domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/injections.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryTab extends StatefulWidget {
  const CountryTab({Key? key}) : super(key: key);

  @override
  State<CountryTab> createState() => _ListCardTabState();
}

class _ListCardTabState extends State<CountryTab> {
  final int _rowsPerPage = 50;
  late CountryGridSource countrySource;
  late DataPagerController controller;
  double pageCount = 0;

  @override
  void initState() {
    super.initState();
    countrySource = CountryGridSource(context, countryEntity: [], countryCount: 0);
    controller = DataPagerController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (context) => sl<CountryCubit>()..getAllData(const CountryParamsEntity()),
        ),
      ],
      child: BlocConsumer<CountryCubit, CountryState>(
        listener: (context, state) {
          if (state.status.isLoaded) {
            setState(() {
              countrySource = CountryGridSource(
                context,
                countryEntity: state.countryEntity!.rows,
                countryCount: state.countryEntity!.totalRows,
              );
            });
          }
        },
        builder: (context, state) => Column(
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
              onAdd: () async {
                final answerState = await AppDialog.form(
                  context: context,
                  title: 'Add Country',
                  content: const CountryFormPage(),
                );
              },
              onFilter: () => AppDialog.filter<bool>(
                context: context,
                title: 'Filter Kartu',
                content: const ListCardFilterForm(),
                onSubmitted: () {},
                onReset: () {},
              ),
              onImport: () => AppDialog.import(
                context: context,
                title: 'Import kartu',
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
                title: 'Export daftar kartu',
                description: 'Unduh atau export ke file dokumen excel.',
                // submitted: 'Export',
                // onSubmitted: () {},
              ),
            ),
            if (state.status.isLoaded)
              Expanded(
                child: MainTable(
                  source: countrySource,
                  rowsPerPage: _rowsPerPage,
                  onCellTap: (DataGridCellTapDetails details) async {
                    final DataGridRow row = countrySource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                    int id = row.getCells().first.value;

                    if (details.rowColumnIndex.rowIndex != 0) {
                      final detailState = await AppDialog.detail(
                        context: context,
                        content: CountryDetailPage(
                          country: state.countryEntity!.rows.firstWhere((element) => element.id == id),
                        ),
                      );

                      if (detailState!.isEdit) {
                        AppDialog.form(
                          context: context,
                          title: 'Edit',
                          content: CountryFormPage(
                            country: state.countryEntity!.rows.firstWhere((element) => element.id == id),
                          ),
                        );
                      }

                      if (detailState.isDelete) {
                        AppDialog.confirm(
                          context: context,
                          title: 'Delete Country',
                          description: 'Apakah anda yakin ingin menghapus kartu ini?',
                        );
                      }
                    }
                  },
                  columns: <GridColumn>[
                    ColumnTableId(context: context, value: 'No'),
                    ColumnTableText(context: context, columnName: 'name', value: 'Name'),
                    ColumnTableText(context: context, columnName: 'capital', value: 'Capital City', width: double.nan),
                    ColumnTableText(context: context, columnName: 'continent', value: 'Continent', width: double.nan),
                    ColumnTableText(
                        context: context, columnName: 'independence', value: 'Independence Day', width: double.nan),
                    ColumnTableNumber(
                        context: context, columnName: 'population', value: 'Population', width: double.nan),
                  ],
                ),
              ),
            if (state.status.isLoaded)
              PagingTable(
                source: countrySource,
                pageCount: (countrySource.rows.length / _rowsPerPage).ceilToDouble(),
                controller: controller,
              ),
            if (state.status.isLoading) const Expanded(child: Center(child: CircularProgressIndicator())),
            if (state.status.isNotLoaded) Expanded(child: Center(child: Text(state.errorMessage!))),
          ],
        ),
      ),
    );
  }
}
