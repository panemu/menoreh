import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryFilterForm extends StatefulWidget {
  const CountryFilterForm({Key? key}) : super(key: key);

  @override
  State<CountryFilterForm> createState() => _CountryFilterFormState();
}

class _CountryFilterFormState extends State<CountryFilterForm> {
  @override
  Widget build(BuildContext context) {
    return ContentDialogForm(
      onYesOk: () {},
      onThird: () {},
      child: Column(
        children: [
          TextFieldDropdown(
            onChanged: (value) {},
            title: 'Coountry Name',
            hint: 'Sort Name',
            items: const ['Asending', 'Desending'],
          ),
          SizedBox(height: AppDimens.size3M),
          TextFieldDropdown(
            onChanged: (value) {},
            title: 'Capital Name',
            hint: 'Sort Capital',
            items: const ['Asending', 'Desending'],
          ),
          SizedBox(height: AppDimens.size3M),
          TextFieldDropdown(
            onChanged: (value) {},
            title: 'Continent Name',
            hint: 'Sort Continent',
            items: const ['Asending', 'Desending'],
          ),
          SizedBox(height: AppDimens.size3M),
          TextFieldDropdown(
            onChanged: (value) {},
            title: 'Date of Independence',
            hint: 'Sort Continent',
            items: const ['Latest', 'Earliest'],
          ),
          SizedBox(height: AppDimens.size3M),
          TextFieldDropdown(
            onChanged: (value) {},
            title: 'Population',
            hint: 'Sort Population',
            items: const ['Largest', 'Smallest'],
          ),
        ],
      ),
    );
  }
}
