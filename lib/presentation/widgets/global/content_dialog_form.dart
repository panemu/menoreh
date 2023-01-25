import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ContentDialogForm extends StatelessWidget {
  final Widget child;
  final bool? isScrollable;
  final void Function() onYesOk;
  final void Function()? onCancel;
  final void Function()? onThird;
  final String? labelYesOk;
  final String? labelCancel;

  const ContentDialogForm({
    Key? key,
    required this.child,
    required this.onYesOk,
    this.onCancel,
    this.onThird,
    this.isScrollable = false,
    this.labelYesOk = 'Save',
    this.labelCancel = 'Cancel',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isScrollable! ? 1 : 0,
          child: SingleChildScrollView(
            child: child,
          ),
        ),
        SizedBox(height: AppDimens.size2L),
        Row(
          mainAxisAlignment: onThird != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (onThird != null)
              OutlinedButton(
                onPressed: onThird,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.red,
                  side: const BorderSide(color: AppColors.red),
                ),
                child: const Text('Reset Filter'),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onCancel ?? context.router.pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.fillTertiary,
                    foregroundColor: AppColors.labelSecondary,
                  ),
                  child: Text(labelCancel!),
                ),
                SizedBox(width: AppDimens.size2M),
                ElevatedButton(
                  onPressed: onYesOk,
                  child: Text(onThird != null ? 'Filter' : labelYesOk!),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
