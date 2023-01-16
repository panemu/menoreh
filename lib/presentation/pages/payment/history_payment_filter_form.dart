import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class HistoryPaymentFilterForm extends StatelessWidget {
  const HistoryPaymentFilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Nama paket',
          hint: 'Pilih nama paket',
          selectedItem: 'Semua status',
          items: const ['Semua status', 'Kencan', 'Teman', 'Nongkrong', 'Keluarga'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Status pembayaran',
          hint: 'Pilih status pembayaran',
          selectedItem: 'Semua status',
          items: const ['Semua status', 'Aktif', 'Panding', 'Gagal'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Metode pembayaran',
          hint: 'Pilih metode',
          selectedItem: 'Semua metode',
          items: const ['Semua metode', 'IAP', 'Token'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Status',
          hint: 'Pilih status',
          selectedItem: 'Semua status',
          items: const ['Semua status', 'Aktif', 'Tidak aktif'],
        ),
      ],
    );
  }
}