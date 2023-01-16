import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldRow extends StatelessWidget {
  final String? title;
  final Widget startWidget;
  final Widget lastWidget;

  const TextFieldRow({
    Key? key,
    this.title,
    required this.startWidget,
    required this.lastWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, textAlign: TextAlign.left),
        if (title != null) SizedBox(height: AppDimens.size3S),
        Row(
          children: [
            Expanded(child: startWidget),
            SizedBox(width: AppDimens.size3S),
            SizedBox(
              width: AppDimens.widthFieldRow,
              child: lastWidget,
            ),
          ],
        ),
      ],
    );
  }
}