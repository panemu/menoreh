import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class AppDialog {
  AppDialog._();

  static Future<AnswerState?> handleError(
    BuildContext context,
    String error, [
    StackTrace? stackTrace,
  ]) =>
      confirm(
        context: context,
        title: "Error",
        description: error,
        labelCancel: '',
      );

  static Future<AnswerState?> export(BuildContext context, {String? description}) => confirm(
        context: context,
        title: "Export",
        description: description ?? 'For export this data please click Export.',
        labelYesOk: 'Export',
      );

  static Future<AnswerState?> confirm({
    required BuildContext context,
    String? title = 'Info',
    String? description,
    Widget? content,
    bool? isDismiss = true,
    String? labelYesOk = 'Ok',
    String? labelCancel = 'Batal',
    Color? colorYesOk,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title!, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.size3S)]);
    if (description != null) structure.add(Text(description, style: AppTextStyle.dialogDesc));
    if (content != null) structure.addAll([SizedBox(height: AppDimens.sizeL), content]);

    if (labelCancel!.isNotEmpty) {
      action.add(
        ElevatedButton(
          onPressed: () => context.router.pop<AnswerState>(AnswerState.cancel),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.fillTertiary,
            foregroundColor: AppColors.labelSecondary,
          ),
          child: Text(labelCancel),
        ),
      );
    }

    action.addAll([
      SizedBox(width: AppDimens.size2M),
      ElevatedButton(
        onPressed: () => context.router.pop<AnswerState>(AnswerState.yesOk),
        style: ElevatedButton.styleFrom(backgroundColor: colorYesOk ?? AppColors.primary),
        child: Text(labelYesOk!),
      ),
    ]);

    return showDialog<AnswerState>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: context.maxWidthDialog,
              ),
              padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < structure.length; i++) structure[i],
                  SizedBox(height: AppDimens.size2L),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: action.map((e) => e).toList(),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> import<T>({
    required BuildContext context,
    required String title,
    String? description,
    Widget? content,
    bool? isDismiss = true,
    required VoidCallback? onSubmitted,
    required VoidCallback? onDownload,
    VoidCallback? onBack,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.size3S)]);
    if (description != null) structure.add(Text(description, style: AppTextStyle.dialogDesc));
    if (content != null) structure.addAll([SizedBox(height: AppDimens.sizeL), content]);

    action.addAll([
      ElevatedButton(
        onPressed: () {
          context.router.pop();
          onBack!.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fillTertiary,
          foregroundColor: AppColors.labelSecondary,
        ),
        child: const Text('Batal'),
      ),
      SizedBox(width: AppDimens.size2M),
      ElevatedButton(
        onPressed: () => onSubmitted!.call(),
        child: const Text('Import'),
      ),
    ]);

    return showDialog<T>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: context.maxWidthDialog),
              padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < structure.length; i++) structure[i],
                  SizedBox(height: AppDimens.size2L),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => onDownload!.call(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.labelSecondary,
                          side: BorderSide(color: AppColors.labelSecondary),
                        ),
                        icon: const Icon(Icons.save_alt_outlined),
                        label: const Text('Template'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: action.map((e) => e).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<AnswerState?> filter({
    required BuildContext context,
    required Widget content,
    String? title = 'Filter',
    bool? isDismiss = false,
    bool? isScrollable = false,
  }) {
    return form(
      context: context,
      title: title!,
      content: content,
      isScrollable: isScrollable,
      isDismiss: isDismiss,
    );
  }

  static Future<AnswerState?> form({
    required BuildContext context,
    required String title,
    bool? isDismiss = false,
    bool? isScrollable = false,

    /// Please use widget `ContentDialogForm`
    required Widget content,
  }) {
    return showDialog<AnswerState>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              width: context.maxWidthDialog,
              constraints: isScrollable!
                  ? BoxConstraints(
                      maxHeight: context.maxHeightDialogDetail,
                    )
                  : const BoxConstraints(),
              padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.dialogTitle),
                  SizedBox(height: AppDimens.size3M),
                  content,
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<DatailDialogState?> detail({
    required BuildContext context,
    String? title = 'Detail',
    required Widget content,
    bool? isDismiss = true,
    String? imageUrl,
    String? labelEdit = 'Ubah',
    String? labelDelete = 'Hapus',
    Color? editColor,
    Color? deleteColor,
    bool? isScrollable = false,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title!, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.sizeL)]);

    if (labelDelete!.isNotEmpty) {
      action.addAll([
        ElevatedButton(
          onPressed: () => context.router.pop<DatailDialogState>(DatailDialogState.delete),
          style: ElevatedButton.styleFrom(backgroundColor: deleteColor ?? AppColors.red),
          child: Text(labelDelete),
        ),
        SizedBox(width: AppDimens.size2M),
      ]);
    }

    if (labelEdit!.isNotEmpty) {
      action.add(
        ElevatedButton(
          onPressed: () => context.router.pop<DatailDialogState>(DatailDialogState.edit),
          style: ElevatedButton.styleFrom(backgroundColor: editColor ?? AppColors.green),
          child: Text(labelEdit),
        ),
      );
    }

    return showDialog<DatailDialogState>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              width: context.maxWidthDialogDetail,
              constraints: isScrollable!
                  ? BoxConstraints(
                      maxHeight: context.maxHeightDialogDetail,
                    )
                  : const BoxConstraints(),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
              ),
              child: Stack(
                children: [
                  IconCloseButton(
                    onPressed: () => context.router.pop<DatailDialogState>(DatailDialogState.close),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < structure.length; i++) structure[i],
                        Expanded(
                          flex: isScrollable ? 1 : 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: content,
                                ),
                              ),
                              if (imageUrl != null)
                                Offstage(offstage: context.isPhone, child: SizedBox(width: AppDimens.sizeL)),
                              if (imageUrl != null)
                                Offstage(
                                  offstage: context.isPhone,
                                  child: ClickableImageWidget(
                                    imageUrl: imageUrl,
                                    radius: AppDimens.radiusLargeX,
                                    size: AppDimens.imageAvatar,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimens.size2L),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: action,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class ContentForm {
  final Widget content;
  final void Function()? onYesOk;
  final void Function()? cancel;

  ContentForm(this.content, this.onYesOk, this.cancel);
}
