import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CategoryCardFilterForm extends StatelessWidget {
  const CategoryCardFilterForm({Key? key}) : super(key: key);

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
          title: 'Status',
          hint: 'Pilih status',
          selectedItem: 'Semua status',
          items: const ['Semua status', 'Aktif', 'Tidak aktif'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Jumlah kartu',
          hint: 'Pilih jumlah kartu',
          selectedItem: 'Semua jumlah',
          items: const ['Semua jumlah', 'Tertinggi', 'Terendah'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Harga kartu',
          hint: 'Pilih harga kartu',
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
