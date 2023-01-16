import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ListCardAddForm extends StatelessWidget {
  const ListCardAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldDropdownSearch<String>(
          onChanged: (String? value) {},
          title: 'Tipe kartu',
          hint: 'Pilih tipe kartu',
          itemAsString: (element) => element.toString(),
          compareFn: (selected, val) => val == null ? false : selected == val,
          items: const ["Rasa karsa", "Tebak gambar", "Truth or Dare", "Sambung kata"],
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldDropdownSearch<String>(
          onChanged: (String? value) {},
          title: 'Kategori kartu',
          hint: 'Pilih kategori kartu',
          itemAsString: (element) => element.toString(),
          compareFn: (selected, val) => val == null ? false : selected == val,
          items: const ["Teman", "Perkenalan", "Keluarga", "Pacar"],
        ),
        SizedBox(height: AppDimens.size4M),
        const TextFieldBasic(
          title: 'Konten',
          hint: 'Masukan konten kartu',
          multiline: true,
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldSwitchButton(
          title: 'Status',
          label: 'Role ini tersedia',
          onChanged: (bool value) {},
        )
      ],
    );
  }
}
