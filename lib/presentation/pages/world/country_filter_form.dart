import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ListCardFilterForm extends StatelessWidget {
  const ListCardFilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Tipe',
          hint: 'Pilih tipe',
          selectedItem: 'Semua tipe',
          items: const ['Semua tipe', 'Rasa karsa', 'Tebak gambar', 'Truth or Dare'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Kategori',
          hint: 'Pilih ketegori',
          selectedItem: 'Semua kategori',
          items: const ['Semua kategori', 'Perkenalan', 'Teman', 'Keluarga'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Status',
          hint: 'Pilih status',
          selectedItem: 'Semua status',
          items: const ['Semua status', 'Aktif', 'Tidak aktif'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Tanggal dibuat',
          hint: 'Pilih tanggal',
          selectedItem: 'Terbaru',
          items: const ['Terbaru', 'Terlama'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Tanggal diubah',
          hint: 'Pilih tanggal',
          selectedItem: 'Terbaru',
          items: const ['Terbaru', 'Terlama'],
        ),
      ],
    );
  }
}
