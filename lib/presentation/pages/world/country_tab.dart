// ignore_for_file: avoid_single_cascade_in_expression_statements, use_build_context_synchronously
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
  late CountryParamsEntity countryParams;
  double pageCount = 0;

  @override
  void initState() {
    super.initState();
    countrySource = CountryGridSource(context, countryEntity: [], countryCount: 0);
    controller = DataPagerController();
    countryParams = const CountryParamsEntity();
  }

  @override
  void dispose() {
    super.dispose();
    Debounce.cancel(TAG_NAME_COUNTRY);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (_) => sl<CountryCubit>()..getAllData(countryParams),
        ),
        BlocProvider<CountryDeleteCubit>(
          create: (_) => sl<CountryDeleteCubit>(),
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
        builder: (context, state) {
          return BlocConsumer<CountryDeleteCubit, CountryDeleteState>(
            listener: (_, stateDelete) {
              if (stateDelete.status.isLoading) {
                SmartDialog.showLoading();
              } else if (stateDelete.status.isLoaded) {
                SmartDialog.dismiss();
                context.read<CountryCubit>().getAllData(countryParams);
              } else if (stateDelete.status.isNotLoaded) {
                SmartDialog.dismiss();
                AppDialog.handleError(context, stateDelete.errorMessage!);
              }
            },
            builder: (ctxDelete, _) {
              return Column(
                children: <Widget>[
                  SidebarBodyCard(
                    contents: [
                      ContentSidebarBodyCard(
                        isLoading: state.status.isLoading,
                        icon: Icons.public_outlined,
                        title: 'Total Country',
                        value: state.status.isLoaded ? state.totalCountry!.textDecimalDigit : '',
                      ),
                      ContentSidebarBodyCard(
                        isLoading: state.status.isLoading,
                        icon: Icons.people_outline_outlined,
                        title: 'Total Population',
                        value: state.status.isLoaded ? state.totalPopulation!.textDecimalDigit : '',
                      ),
                      ContentSidebarBodyCard(
                        isLoading: state.status.isLoading,
                        icon: Icons.arrow_circle_up_outlined,
                        title: 'Latest Independence',
                        value: state.status.isLoaded ? state.latestIndependence!.toDateTime().yMMMMd : '',
                      ),
                      ContentSidebarBodyCard(
                        isLoading: state.status.isLoading,
                        icon: Icons.arrow_circle_down_outlined,
                        title: 'Earliest Independence',
                        value: state.status.isLoaded ? state.earliestIndependence!.toDateTime().yMMMMd : '',
                      ),
                    ],
                  ),
                  Divider(height: AppDimens.sizeZero),
                  SidebarBodyAction(
                    searchReceptacle: SerachReceptacle(
                      hint: 'Search name country',
                      onSearch: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            countryParams = CountryParamsEntity(
                              tableQuery: TableQueryEntity(
                                tableCriteria: [TableCriteriaEntity(attributeName: 'name', value: value)],
                              ),
                            );
                          });

                          Debounce.debounce(
                            TAG_NAME_COUNTRY,
                            const Duration(milliseconds: 500),
                            () => context.read<CountryCubit>().getAllData(countryParams),
                          );
                        }
                      },
                    ),
                    onAdd: () async {
                      final answer = await AppDialog.form(
                        context: context,
                        title: 'Add Country',
                        content: const CountryFormPage(),
                      );

                      if (answer!.isYesOk) {
                        context.read<CountryCubit>().getAllData(countryParams);
                      }
                    },
                    filterReceptacle: FilterReceptacle(
                      onFilter: () async {
                        final answer = await AppDialog.filter(
                          context: context,
                          title: 'Sort',
                          isDismiss: true,
                          content: const CountryFilterForm(),
                        );

                        if (answer!.isYesOk) {
                          //TODO function to sort data
                        }
                      },
                      isActive: false,
                      tooltip: 'Sort',
                    ),
                    onExport: () async {
                      final answer = await AppDialog.export(context);

                      if (answer!.isYesOk) {
                        //TODO function to export data
                      }
                    },
                  ),
                  if (state.status.isLoaded)
                    Expanded(
                      child: MainTable(
                        source: countrySource,
                        rowsPerPage: _rowsPerPage,
                        onCellTap: (DataGridCellTapDetails details) async {
                          final rowIndex = details.rowColumnIndex.rowIndex;
                          final DataGridRow row = countrySource.effectiveRows[rowIndex - 1];
                          final id = row.getCells().first.value;
                          final country = state.countryEntity!.rows.firstWhere((element) => element.id == id);

                          if (rowIndex != 0) {
                            final detailState = await AppDialog.detail(
                              context: context,
                              content: CountryDetailPage(country: country),
                            );

                            if (detailState!.isEdit) {
                              final answer = await AppDialog.form(
                                context: context,
                                title: 'Edit',
                                content: CountryFormPage(country: country),
                              );

                              if (answer!.isYesOk) {
                                context.read<CountryCubit>().getAllData(countryParams);
                              }
                            }

                            if (detailState.isDelete) {
                              final deleteDialog = await AppDialog.confirm(
                                context: context,
                                title: 'Delete Country',
                                description: 'Are you sure to delete this country?',
                              );

                              if (deleteDialog!.isYesOk) {
                                ctxDelete.read<CountryDeleteCubit>().deleteData(id);
                              }
                            }
                          }
                        },
                        columns: <GridColumn>[
                          ColumnTableId(context: context, value: 'No'),
                          ColumnTableText(context: context, columnName: 'name', value: 'Name'),
                          ColumnTableText(
                              context: context, columnName: 'capital', value: 'Capital City', width: double.nan),
                          ColumnTableText(
                              context: context, columnName: 'continent', value: 'Continent', width: double.nan),
                          ColumnTableText(
                              context: context,
                              columnName: 'independence',
                              value: 'Independence Day',
                              width: double.nan),
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
              );
            },
          );
        },
      ),
    );
  }
}
