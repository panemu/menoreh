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
  final int _rowsPerPage = 15;
  late CountryGridSource countrySource;
  double pageCount = 0;

  @override
  void initState() {
    super.initState();
    countrySource = CountryGridSource(countryEntity: [], countryCount: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (context) => sl<CountryCubit>()..getAllData(const CountryParamsEntity()),
        ),
      ],
      child: BlocListener<CountryCubit, CountryState>(
        listener: (_, state) {
          if (state.status.isLoaded) {
            setState(() {
              countrySource = CountryGridSource(
                countryEntity: state.countryEntity!.rows,
                countryCount: state.countryEntity!.totalRows,
              );

              pageCount = countrySource.countryEntity.length / _rowsPerPage;
            });
          }
        },
        child: Column(
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
                title: 'Tambah Kartu',
                heightReduce: AppDimens.size4XL,
                content: const ListCardAddForm(),
                onSubmitted: () {},
              ),
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
            Expanded(
              child: MainTable(
                source: countrySource,
                rowsPerPage: _rowsPerPage,
                onCellTap: (DataGridCellTapDetails details) {
                  if (details.rowColumnIndex.rowIndex != 0) {
                    // final DataGridRow row = countrySource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
                    // int index = countrySource.dataGridRows.indexOf(row);

                    AppDialog.detail(
                      context: context,
                      title: 'Detail kartu',
                      heightReduce: AppDimens.size8X,
                      content: [
                        const ListRowBasic(
                          label: 'Konten',
                          value: 'Siapa orang terakhir yang kamu hubungi di WhatsApp?',
                          multiLine: true,
                        ),
                        const ListRowChip(label: 'Tipe', value: 'Rasa Karsa', colorClip: AppColors.blue),
                        const ListRowChip(label: 'Kategori', value: 'Nongkrong', colorClip: AppColors.tial),
                        const ListRowChip(label: 'Status', value: 'Aktif', colorClip: AppColors.green),
                        ListRowHighline(
                          onAdd: () => AppDialog.form(
                            context: context,
                            title: 'Tambahkan highline',
                            heightReduce: AppDimens.sizeXL,
                            content: Column(
                              children: [
                                TextFieldDropdown(
                                  title: 'Kata',
                                  hint: 'Pilih kata',
                                  items: 'Siapa orang terakhir yang kamu hubungi di WhatsApp?'.split(' '),
                                ),
                                SizedBox(height: AppDimens.size4M),
                                const TextFieldBasic(
                                  title: 'Deskripsi',
                                  hint: 'Masukan deskripsi',
                                  multiline: true,
                                ),
                                SizedBox(height: AppDimens.size4M),
                                const TextFieldBasic(
                                  title: 'Link sumber',
                                  hint: 'Masukan link sumber',
                                ),
                                SizedBox(height: AppDimens.size4M),
                                TextFieldPicker(
                                  title: 'Gambar pendukung',
                                  fileType: FileType.image,
                                  onDone: (files) {},
                                ),
                              ],
                            ),
                            onSubmitted: () {},
                          ),
                          label: 'Highline',
                          listValue: [
                            ListRowHighlineValue(
                              onClick: () => AppDialog.detail(
                                context: context,
                                heightReduce: AppDimens.size8X * 2,
                                title: 'Detail highline',
                                imageUrl: AppImages.avatarUrl,
                                content: [
                                  const ListRowBasic(label: 'Kata', value: 'Whatapp'),
                                  const ListRowBasic(
                                    label: 'Konten',
                                    value: 'Phasellus consectetur facilisis',
                                    multiLine: true,
                                  ),
                                  ListRowLink(label: 'Link sumber', onClick: () {}),
                                  ListRowBasic(label: 'Tgl dibuat', value: 1651538822143.formMillisecondsSinceEpoch),
                                  ListRowBasic(label: 'Tgl diubah', value: 1651538822143.formMillisecondsSinceEpoch),
                                ],
                              ),
                              value: 'Whatsapp',
                            ),
                          ],
                        ),
                        ListRowBasic(label: 'Tgl dibuat', value: 1651538822143.formMillisecondsSinceEpoch),
                        ListRowBasic(label: 'Tgl diubah', value: 1651538822143.formMillisecondsSinceEpoch),
                      ],
                      onDelete: () => AppDialog.confirm(
                        context: context,
                        title: 'Hapus kartu',
                        description: 'Apakah anda yakin ingin menghapus kartu ini?',
                        // submittedColor: AppColors.red,
                        // submitted: 'Hapus',
                        // onSubmitted: () {},
                      ),
                      onEdit: () {},
                    );
                  }
                },
                columns: <GridColumn>[
                  ColumnTableId(context: context, value: 'Number'),
                  ColumnTableText(context: context, columnName: 'name', value: 'Name'),
                  ColumnTableText(context: context, columnName: 'capital', value: 'Capital City', width: double.nan),
                  ColumnTableText(context: context, columnName: 'continent', value: 'Continent', width: double.nan),
                  ColumnTableText(
                      context: context, columnName: 'independence', value: 'Independence Day', width: double.nan),
                  ColumnTableText(context: context, columnName: 'population', value: 'Population', width: double.nan),
                ],
              ),
            ),
            PagingTable(
              source: countrySource,
              pageCount: pageCount,
            ),
          ],
        ),
      ),
    );
  }
}
