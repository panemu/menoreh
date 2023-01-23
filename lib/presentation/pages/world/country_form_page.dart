import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryFormPage extends StatelessWidget {
  final CountryEntity? country;

  const CountryFormPage({Key? key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldBasic(
          initialValue: country == null ? null : country!.name,
          title: 'Country Name',
          hint: 'Enter Country Name',
        ),
        SizedBox(height: AppDimens.sizeL),
        TextFieldBasic(
          initialValue: country == null ? null : country!.capital,
          title: 'Capital City Name',
          hint: 'Enter Capital City Name',
        ),
        SizedBox(height: AppDimens.sizeL),
        TextFieldDropdownSearch<String>(
          onChanged: (String? value) {},
          selectedItem: country == null ? null : country!.continent,
          title: 'Continent Name',
          hint: 'Enter Continent Name',
          itemAsString: (element) => element.toString(),
          compareFn: (selected, val) => val == null ? false : selected == val,
          items: const ["Asia", "Afrika", "Australia", "Amerika"],
        ),
        SizedBox(height: AppDimens.sizeL),
        TextFieldDatePicker(
          onChanged: (String? value) {},
          initialDate: country == null
              ? null
              : country!.independence.isEmpty
                  ? null
                  : country!.independence.toDateTime(),
          title: 'Date of Independence',
          hint: 'Enter Date Independence',
        ),
        SizedBox(height: AppDimens.sizeL),
        TextFieldBasic(
          initialValue: country == null ? null : country!.population.textDecimalDigit,
          title: 'Population',
          hint: 'Enter Population',
          inputType: TextInputType.number,
        ),
      ],
    );
  }
}
