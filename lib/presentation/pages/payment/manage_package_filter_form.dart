import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ManagePackageFilterForm extends StatelessWidget {
  const ManagePackageFilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          title: 'Masa paket',
          hint: 'Pilih masa',
          selectedItem: 'Semua masa',
          items: const ['Semua masa', 'Teratas', 'Terendah'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Harga paket',
          hint: 'Pilih harga',
          selectedItem: 'Semua harga',
          items: const ['Semua harga', 'Tertinggi', 'Terendah'],
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
