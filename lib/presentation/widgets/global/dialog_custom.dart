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

  static Future<T?> filter<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    bool? isDismiss = true,
    double? heightReduce = 0,
    required VoidCallback? onSubmitted,
    required VoidCallback? onReset,
    VoidCallback? onBack,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.size3M)]);

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
        child: const Text('Terapkan'),
      ),
    ]);

    return showDialog<T>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.sizeL),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radiusLargeX)),
          child: Container(
            width: context.maxWidthDialog,
            height: context.maxHeightDialogDetail - heightReduce!,
            padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < structure.length; i++) structure[i],
                Expanded(
                  child: SingleChildScrollView(
                    child: content,
                  ),
                ),
                SizedBox(height: AppDimens.size2L),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () => onReset!.call(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.red,
                        side: const BorderSide(color: AppColors.red),
                      ),
                      child: const Text('Reset Filter'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: action,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<T?> form<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    bool? isDismiss = false,
    required VoidCallback? onSubmitted,
    VoidCallback? onBack,
    double? heightReduce = 0,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.size3M)]);

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
        child: const Text('Simpan'),
      ),
    ]);

    return showDialog<T>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.sizeL),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radiusLargeX)),
          child: Container(
            width: context.maxWidthDialog,
            height: context.maxHeightDialogDetail - heightReduce!,
            padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < structure.length; i++) structure[i],
                Expanded(
                  child: SingleChildScrollView(
                    child: content,
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
        );
      },
    );
  }

  static Future<T?> detail<T>({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    bool? isDismiss = true,
    String? imageUrl,
    String editText = 'Ubah',
    String deleteText = 'Hapus',
    Color? editColor,
    Color? deleteColor,
    double? heightReduce = 0,
    VoidCallback? onEdit,
    VoidCallback? onDelete,
    VoidCallback? onClose,
  }) {
    late List<Widget> structure = [];
    late List<Widget> action = [];

    structure.addAll([Text(title, style: AppTextStyle.dialogTitle), SizedBox(height: AppDimens.sizeL)]);

    if (imageUrl != null && context.width < 600) {
      content.insert(
        0,
        SizedBox(
          width: AppDimens.imageAvatarMobile.width,
          height: AppDimens.imageAvatarMobile.height,
          child: ClickableImageWidget(
            imageUrl: imageUrl,
            radius: AppDimens.radiusLargeX,
            size: AppDimens.imageAvatarMobile,
          ),
        ),
      );
    }

    if (onDelete != null) {
      action.addAll([
        ElevatedButton(
          onPressed: onDelete,
          style: ElevatedButton.styleFrom(backgroundColor: deleteColor ?? AppColors.red),
          child: Text(deleteText),
        ),
        SizedBox(width: AppDimens.size2M),
      ]);
    }

    if (onEdit != null) {
      action.add(
        ElevatedButton(
          onPressed: onEdit,
          style: ElevatedButton.styleFrom(backgroundColor: editColor ?? AppColors.green),
          child: Text(editText),
        ),
      );
    }

    return showDialog<T>(
      context: context,
      barrierDismissible: isDismiss!,
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              width: context.maxWidthDialogDetail,
              height: context.maxHeightDialogDetail - heightReduce!,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
              ),
              child: Stack(
                children: [
                  IconCloseButton(
                    onPressed: () {
                      context.router.pop();
                      onClose!.call();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.sizeXL, vertical: AppDimens.size2L),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < structure.length; i++) structure[i],
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: content.length,
                                  itemBuilder: (_, index) => content[index],
                                  separatorBuilder: (_, __) => Divider(height: AppDimens.sizeL),
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
