import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class RoleUsersAddForm extends StatelessWidget {
  const RoleUsersAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldBasic(
          title: 'Nama Role',
          hint: 'Masukan nama role',
        ),
        SizedBox(height: AppDimens.size4M),
        const TextFieldBasic(
          title: 'Deskripsi',
          hint: 'Masukan deskripsi',
          multiline: true,
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldSwitchButton(
          onChanged: (bool value) {},
          title: 'Status',
          label: 'Kartu tersedia',
        ),
      ],
    );
  }
}
