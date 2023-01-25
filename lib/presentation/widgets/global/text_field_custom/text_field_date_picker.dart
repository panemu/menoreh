import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldDatePicker extends StatelessWidget {
  final String? title;
  final String hint;
  final bool enabled;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFieldDatePicker({
    Key? key,
    required this.hint,
    this.title,
    this.controller,
    this.enabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title!.isNotEmpty) Text(title!, textAlign: TextAlign.left),
        if (title!.isNotEmpty) SizedBox(height: AppDimens.size3S),
        TextFormField(
          autocorrect: true,
          controller: controller,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(color: AppColors.grey),
            hintText: hint,
            contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
            prefixIcon: Icon(
              Icons.calendar_today,
              size: 18.0,
              color: AppColors.labelSecondary,
            ),
          ),
          readOnly: true,
          onTap: () async {
            if (enabled) {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: controller!.text.isNotEmpty ? controller!.text.textDateTimeOnly.toDateTime() : DateTime.now(),
                firstDate: firstDate ?? DateTime(1545),
                lastDate: lastDate ?? DateTime.now(),
              );

              if (date != null) {
                controller!.text = date.yMMMMd;
              } else {
                log('date not selected');
              }
            }
          },
        ),
      ],
    );
  }
}
