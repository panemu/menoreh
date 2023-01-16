import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ListUsersFilterForm extends StatelessWidget {
  const ListUsersFilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Metode login',
          hint: 'Pilih metode',
          selectedItem: 'Semua metode',
          items: const ['Semua metode', 'Google', 'Password'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Role user',
          hint: 'Pilih role',
          selectedItem: 'Semua role',
          items: const ['Semua role', 'Admin', 'Manager', 'User'],
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
