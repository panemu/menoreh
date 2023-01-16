import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CategoryCardAddForm extends StatelessWidget {
  const CategoryCardAddForm({Key? key}) : super(key: key);

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
        const TextFieldBasic(
          title: 'Nama kategori',
          hint: 'Masukan nama kategori',
        ),
        SizedBox(height: AppDimens.size4M),
        const TextFieldBasic(
          title: 'Deskipsi',
          hint: 'Masukan deskripsi',
          multiline: true,
        ),
        SizedBox(height: AppDimens.size4M),
        Row(
          children: [
            const Expanded(
              child: TextFieldBasic(
                title: 'Min pemain',
                hint: 'Masukan jumlah',
                inputType: TextInputType.number,
              ),
            ),
            SizedBox(width: AppDimens.size3S),
            const Expanded(
              child: TextFieldBasic(
                title: 'Max pemain',
                hint: 'Masukan jumlah',
                inputType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldCurrency(
          controller: TextEditingController(),
          title: 'Harga',
          hint: 'Masukan harga',
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldTagCustom(
          controller: TextfieldTagsController(),
          title: 'Tag',
          hint: 'Masukan tag',
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldPicker(
          title: 'Gambar',
          fileType: FileType.custom,
          fileExtension: const [FileExtension.png],
          onDone: (files) {},
        ),
        SizedBox(height: AppDimens.size4M),
        TextFieldSwitchButton(
          title: 'Status',
          label: 'Kartu tersedia',
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}
