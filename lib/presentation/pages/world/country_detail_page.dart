import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryDetailPage extends StatelessWidget {
  final CountryEntity country;

  const CountryDetailPage({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListRowBasic(label: 'Number', value: country.id.toString()),
        Divider(height: AppDimens.sizeL),
        ListRowBasic(label: 'Name', value: country.name),
        Divider(height: AppDimens.sizeL),
        ListRowBasic(label: 'Capital City', value: country.capital),
        Divider(height: AppDimens.sizeL),
        ListRowBasic(label: 'Continent', value: country.continent),
        Divider(height: AppDimens.sizeL),
        ListRowBasic(
          label: 'Independence Day',
          value: country.independence.isEmpty ? '' : country.independence.toDateTime().yMMMMd,
        ),
        Divider(height: AppDimens.sizeL),
        ListRowBasic(label: 'Population', value: country.population.textDecimalDigit),
      ],
    );
  }
}
