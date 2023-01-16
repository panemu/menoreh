import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class TypeCardAddForm extends StatelessWidget {
  const TypeCardAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldBasic(
          onChanged: (String? value) {},
          title: 'Nama tipe',
          hint: 'Masukan nama tipe',
        ),
        SizedBox(height: AppDimens.size4M),
        const TextFieldBasic(
          title: 'Deskripsi',
          hint: 'Masukan deskripsi',
          multiline: true,
        ),
        SizedBox(height: AppDimens.size4M),
        //TODO : please add multiple field
        Row(
          children: [
            const Expanded(
              child: TextFieldBasic(
                title: 'Link bantuan',
                hint: 'Masukan link',
              ),
            ),
            SizedBox(width: AppDimens.size3S),
            const Expanded(
              child: TextFieldBasic(
                title: 'Link video',
                hint: 'Masukan link',
              ),
            ),
          ],
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
        )
      ],
    );
  }
}
