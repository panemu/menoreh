import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ManagePackageAddForm extends StatelessWidget {
  const ManagePackageAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldBasic(title: 'Nama paket', hint: 'Masukan nama paket'),
        SizedBox(height: AppDimens.size3M),
        const TextFieldRow(
          title: 'Masa paket',
          startWidget: TextFieldBasic(
            inputType: TextInputType.number,
            hint: 'Masukan masa aktif',
          ),
          lastWidget: TextFieldDropdown(
            selectedItem: 'Hari',
            items: ['Hari', 'Minggu', 'Bulan'],
          ),
        ),
        SizedBox(height: AppDimens.size3M),
        const _FeatureField(),
        SizedBox(height: AppDimens.size3M),
        TextFieldCurrency(
          controller: TextEditingController(),
          title: 'Harga',
          hint: 'Masukan harga',
        ),
        SizedBox(height: AppDimens.size3M),
        const TextFieldBasic(
          title: 'Deskripsi',
          hint: 'Masukan deskripsi paket',
          multiline: true,
        ),
        SizedBox(height: AppDimens.size3M),
        TextFieldSwitchButton(
          title: 'Status',
          label: 'Paket tersedia',
          onChanged: (bool value) {},
        )
      ],
    );
  }
}

class _FeatureField extends StatelessWidget {
  const _FeatureField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldRow(
          title: 'Fitur',
          startWidget: TextFieldBasic(
            enabled: false,
            initialValue: 'Panggilan Suara',
            hint: '',
          ),
          lastWidget: TextFieldDropdown(
            selectedItem: 'Ya',
            items: ['Ya', 'Tidak'],
          ),
        ),
        SizedBox(height: AppDimens.sizeM),
        const TextFieldRow(
          startWidget: TextFieldBasic(
            enabled: false,
            initialValue: 'Jumlah pemain',
            hint: '',
          ),
          lastWidget: TextFieldBasic(
            initialValue: '2',
            inputType: TextInputType.number,
            hint: 'Jumlah pemain',
          ),
        ),
        SizedBox(height: AppDimens.sizeM),
        const TextFieldRow(
          startWidget: TextFieldBasic(
            enabled: false,
            initialValue: 'Jumlah kartu dibuka',
            hint: '',
          ),
          lastWidget: TextFieldDropdown(
            selectedItem: 'Semua kartu',
            items: ['Semua kartu', '3', '6', '10'],
          ),
        ),
        SizedBox(height: AppDimens.sizeM),
        const TextFieldRow(
          startWidget: TextFieldBasic(
            enabled: false,
            initialValue: 'Buat kartu',
            hint: '',
          ),
          lastWidget: TextFieldDropdown(
            selectedItem: 'Ya',
            items: ['Ya', 'Tidak'],
          ),
        ),
      ],
    );
  }
}
