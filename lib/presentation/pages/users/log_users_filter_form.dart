import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LogUsersFilterForm extends StatelessWidget {
  const LogUsersFilterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Kondisi',
          hint: 'Pilih kodisi',
          selectedItem: 'Semua kondisi',
          items: const ['Semua kondisi', 'Logout', 'Login'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Tipe Pengguna',
          hint: 'Pilih tipe',
          selectedItem: 'Semua tipe',
          items: const ['Semua tipe', 'IOS', 'Android', 'Website'],
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Metode Login',
          hint: 'Pilih metode',
          selectedItem: 'Semua metode',
          items: const ['Semua metode', 'Password', 'Google', 'Facebook']
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Role',
          hint: 'Pilih role',
          selectedItem: 'Semua role',
          items: const ['Semua role', 'Admin', 'Manager', 'User']
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldDropdown(
          onChanged: (value) {},
          title: 'Tanggal',
          hint: 'Pilih tanggal',
          selectedItem: 'Terbaru',
          items: const ['Terbaru', 'Terlama'],
        ),
      ],
    );
  }
}
