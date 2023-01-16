import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldPicker extends StatelessWidget {
  /// text on the top
  final String? title;

  /// On web the `path` will always be `null` as web always use fake paths,
  /// you should use the `bytes` instead to retrieve the picked file data.
  final Function(PlatformFile)? onDone;

  /// default is [FileType.image] used for extension image
  final FileType? fileType;

  /// if you using value [fileExtension] please,
  /// chenge value [fileType] to [FileType.custom]
  final List<FileExtension>? fileExtension;


  const TextFieldPicker({
    Key? key,
    required this.onDone,
    this.title,
    this.fileType = FileType.image,
    this.fileExtension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, textAlign: TextAlign.left),
        if (title != null) SizedBox(height: AppDimens.size3S),

        _PickerBuilder(
          fileExtension: fileExtension ?? [],
          fileType: fileType,
          onDone: onDone!,
        ),
      ],
    );
  }
}

class _PickerBuilder extends StatefulWidget {
  final Function(PlatformFile)? onDone;
  final FileType? fileType;
  final List<FileExtension>? fileExtension;

  const _PickerBuilder({
    Key? key,
    required this.onDone,
    this.fileType,
    this.fileExtension,
  }) : super(key: key);

  @override
  State<_PickerBuilder> createState() => _PickerBuilderState();
}

class _PickerBuilderState extends State<_PickerBuilder> {
  bool _onDrag = false;
  PlatformFile _file = PlatformFile(name: '', size: 0);

  @override
  Widget build(BuildContext context) {
    if (_file.bytes != null) {
      return _FileBuilder(
        file: _file,
        onDelete: () => setState(() => _file = PlatformFile(name: '', size: 0, bytes: null)),
      );
    }

    return DropTarget(
      onDragDone: (detail) async {
        // validate max 5mb
        if (AppUtils.maxFile(await detail.files.single.length())) {
          SmartDialog.showToast('File melebihi batas 5 MB');
          return;
        }

        if (AppUtils.isSomeExtension(widget.fileType!, detail.files.single.mimeType!, widget.fileExtension)) {
          PlatformFile? file = PlatformFile(
            name: detail.files.single.name,
            size: await detail.files.single.length(),
            bytes: await detail.files.single.readAsBytes(),
          );

          widget.onDone!(file);
          setState(() => _file = file);
        } else {
          SmartDialog.showToast('Maaf, File tidak didukung!');
        }
      },
      onDragEntered: (detail) => setState(() => _onDrag = true),
      onDragExited: (detail) => setState(() => _onDrag = false),
      child: DottedBorder(
        color: _onDrag ? AppColors.secondary : AppColors.grey,
        dashPattern: const <double>[8, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppDimens.radiusMedium),
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.paddingMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.upload_file,
                size: AppDimens.sizeXL,
                color: _onDrag ? AppColors.secondary : AppColors.grey.shade400,
              ),
              SizedBox(width: AppDimens.size3S),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Klik untuk upload ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: widget.fileType!,
                            allowedExtensions: widget.fileType! != FileType.custom
                                ? null
                                : widget.fileExtension!.map((e) => e.name).toList(),
                          );

                          if (result != null) {
                            // validate max 5 mb
                            if (AppUtils.maxFile(result.files.single.size)) {
                              SmartDialog.showToast('File melebihi batas 5 MB');
                              return;
                            }
                            widget.onDone!(result.files.single);
                            setState(() => _file = result.files.single);
                          }
                        },
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.secondary, height: 1.25),
                      children: [
                        TextSpan(
                          text: 'atau tarik file',
                          style: TextStyle(color: _onDrag ? AppColors.secondary : AppColors.labelSecondary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.sizeS),
                  Text(
                    'Maksimal ukuran file 5 MB.',
                    style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors.labelSecondary, height: 1.25),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FileBuilder extends StatelessWidget {
  final void Function() onDelete;
  final PlatformFile file;

  const _FileBuilder({Key? key, required this.onDelete, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.secondary,
      dashPattern: const <double>[8, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(AppDimens.radiusMedium),
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingSmall,
          horizontal: AppDimens.paddingMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_present_outlined,
                  size: AppDimens.sizeXL,
                  color: AppColors.blue,
                ),
                SizedBox(width: AppDimens.size3S),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.secondary, height: 1.25),
                    ),
                    SizedBox(width: AppDimens.sizeS),
                    Text(
                      file.bytes!.formatBytes(1),
                      style:
                          Theme.of(context).textTheme.caption!.copyWith(color: AppColors.labelSecondary, height: 1.25),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: onDelete,
              splashRadius: AppDimens.size3M,
              iconSize: AppDimens.size3M,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
